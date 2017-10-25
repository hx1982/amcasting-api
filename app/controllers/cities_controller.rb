class CitiesController < ApplicationController
  before_action :set_state

  def index
    json_response({
        :cities => @state.cities
    })
  end

  def set_state
    @state = State.find(params[:state_id]) if params[:state_id]
  end
end
