class ContactTypesController < ApplicationController
  def index
    json_response({
      contact_type: ContactType.all
    })
  end
end
