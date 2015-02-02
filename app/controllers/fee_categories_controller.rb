class FeeCategoriesController < ApplicationController
  def index
    @categories = FeeCategory.all
  end
end
