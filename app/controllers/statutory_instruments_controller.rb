class StatutoryInstrumentsController < ApplicationController
  def index
    @statutory_instruments = StatutoryInstrument.all
  end

  def show
  end
end
