class CountriesController < ApplicationController
  def index
    @countries = Country.all
    json_response({
        :country => @countries
    })
  end
end
