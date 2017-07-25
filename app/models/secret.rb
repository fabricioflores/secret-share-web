class Secret < ApplicationRecord

  # attr_reader
  def exposed_secret
    self[:exposed_secret]
  end

  # attr_writer
  def exposed_secret=(val)
    self[:exposed_secret] = val
  end

  # virtual attribute
  def exposed_secret
    ShamirSecretSharing::Base58.combine(self.splits)
  end
end
