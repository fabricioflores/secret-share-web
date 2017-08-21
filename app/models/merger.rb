class Merger

  include ActiveModel::Model
  include Virtus

  attribute :exposed_secret, String
  attribute :splits, String

  validates :splits, presence: true

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persist!
    self.splits = self.splits.squish.tr('[]', '').delete('\\"').delete(' ').split(',').map(&:to_s)
    if ShamirSecretSharing::Base58.combine(self.splits)
      self.exposed_secret = ShamirSecretSharing::Base58.combine(self.splits)
    else
      self.exposed_secret = "Bad or insufficient input data"
    end
    true
  end
end
