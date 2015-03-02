class StatutoryInstrumentsController < ApplicationController
  def index
    @statutory_instruments = StatutoryInstrument.all
  end

  def show
    @statutory_instrument = StatutoryInstrument.friendly.find(params[:id])
  end
end
