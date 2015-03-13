class SearchController < ApplicationController
  def fees
  end

  def fee_results
    @query = params[:query]
    @results = Fee.basic_search(title: @query)
  end
end
