class TaxTypesController < ApplicationController
  def index
    json_response({
      tax_type: TaxType.all
    })
  end
end
