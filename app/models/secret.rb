class Secret

  include ActiveModel::Model
  include Virtus

  attribute :exposed_secret, String
  attribute :available, Integer
  attribute :needed, Integer
  attribute :splits, Array[String]

  validates :exposed_secret, presence: true

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persist!
    self.splits = ShamirSecretSharing::Base58.split(secret = self.exposed_secret,
                                                    available=self.available,
                                                    needed=self.needed)
    true
  end

end
