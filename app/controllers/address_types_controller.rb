class AddressTypesController < ApplicationController
  def index
    json_response({
      :address_type => AddressType.all
    });
  end
end
