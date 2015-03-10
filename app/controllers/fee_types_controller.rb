class FeeTypesController < ApplicationController
  def show
    @fee = FeeType.friendly.find(params[:id])
  end

  def sum
    redirect_to fee_payable_path(params[:id], params[:amount])
  end

  def amount
  end
end
