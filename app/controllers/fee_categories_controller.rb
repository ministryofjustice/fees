class FeeCategoriesController < ApplicationController
  def index
    @categories = FeeCategory.all
  end

  def show
  end
end
