class GeneralApplicationsController < ApplicationController

  def index
  end

  def show
    @general_application = GeneralApplication.friendly.find(params[:id])
  end
end
