class MergersController < ApplicationController

  def new
    @merger = Merger.new
  end

  def create
    @merger = Merger.new(merger_params)
    respond_to do |format|
      if @merger.save
        format.js
      else
        format.js
      end
    end
  end

  private
    def merger_params
      params.require(:merger).permit(:splits)
    end
end
