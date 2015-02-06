class FeeTypesController < ApplicationController
  def show
    @fee = FeeType.friendly.find(params[:id])
  end
end
