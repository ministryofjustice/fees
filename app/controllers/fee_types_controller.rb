class FeeTypesController < ApplicationController
  def show
    @fee = FeeType.friendly.find(params[:id])
  end

  def sum
    redirect_to fee_payable_path(params[:id], params[:amount])
  end

  def amount
    @fee = FeeType.friendly.find(params[:id])
    @amount = @fee.get_band(params[:amount])
  end
end
