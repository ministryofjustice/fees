class SearchController < ApplicationController
  def fees
  end

  def fee_results
    @query = params[:query]
    @results = FeeType.search(@query)
  end
end
