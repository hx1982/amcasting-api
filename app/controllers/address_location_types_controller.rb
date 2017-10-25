class AddressLocationTypesController < ApplicationController
  def index
    json_response({
      :address_location_type => AddressLocationType.all
    });
  end
end
