class HomeController < ApplicationController
  def index
    @output = ShamirSecretSharing::Base58.split(secret="hello", available=4, needed=3)
  end
end
