class FeesController < ApplicationController
  def show
    @fee = Fee.friendly.find(params[:id])
  end

  def sum
    redirect_to fee_payable_path(params[:id], params[:amount])
  end

  def amount
    @fee = Fee.friendly.find(params[:id])
    @amount = @fee.get_band(params[:amount])
  end
end
