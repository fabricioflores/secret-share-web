class SecretsController < ApplicationController

  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  # POST /secrets
  # POST /secrets.json
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_params
      params.require(:secret).permit(:available, :needed, :exposed_secret)
    end
end
