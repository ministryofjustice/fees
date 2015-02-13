class SearchController < ApplicationController
  def fees
  end

  def fee_results
    @query = params[:query]
    @results = FeeType.basic_search(title: @query)
  end
end
