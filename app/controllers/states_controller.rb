class StatesController < ApplicationController
  before_action :set_country

  def index
    json_response({
      :states => @country.states
    })
  end

  def set_country
    @country = Country.find(params[:country_id]) if params[:country_id]
  end
end
