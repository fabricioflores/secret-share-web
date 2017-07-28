class SecretsController < ApplicationController

  def new
    @secret = Secret.new
  end

  def create
    @secret = Secret.new(secret_params)
    respond_to do |format|
      if @secret.save
        format.js
      else
        format.js
      end
    end
  end

  private
    def secret_params
      params.require(:secret).permit(:available, :needed, :exposed_secret)
    end
end
