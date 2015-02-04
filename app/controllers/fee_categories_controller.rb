class FeeCategoriesController < ApplicationController
  def index
    @categories = FeeCategory.all
  end

  def show
    @category = FeeCategory.friendly.find(params[:id])
  end
end
