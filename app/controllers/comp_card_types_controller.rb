class CompCardTypesController < ApplicationController
  def index
    json_response(CompCardType.all())
  end
end
