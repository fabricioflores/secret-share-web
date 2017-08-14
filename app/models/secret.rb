class Secret

  include ActiveModel::Model
  include Virtus

  attribute :exposed_secret, String
  attribute :available, Integer
  attribute :needed, Integer
  attribute :splits, Array[String]

  validates :exposed_secret,
            :available,
            :needed, presence: true

  validates :exposed_secret, length: { maximum: 512 }

  validates :available,
            :needed, numericality: { only_integer: true }

  validates :available, numericality: { less_than_or_equal_to: 250 }

  validates :needed, numericality: { less_than_or_equal_to: :available,
                                     message: 'must be less or equal than Available' }

  validates :needed, :available, numericality: { greater_than_or_equal_to: 2 }

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persist!
    self.splits = ShamirSecretSharing::Base58.split(self.exposed_secret,
                                                    self.available,
                                                    self.needed)
    true
  end

end
