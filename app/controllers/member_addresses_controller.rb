require 'pp'

class MemberAddressesController < ApplicationController
  before_action :set_member, only: [:index]
  before_action :set_address, only: [:show, :update, :destroy]

  def index
    addresses = [];
    countries = [];
    states = [];
    cities = [];
    address_types = [];
    address_location_types = [];
    @member_addresses = @member.member_address.includes(:address => [:address_location_type, :address_type, :country, :state, :city])
    #json_response(@member.member_address.to_json(:include => :address))
    @member_addresses.each do |member_address|
      addresses.push({
          :id => member_address.id,
          :member_id => @member.id,
          :street => member_address.address.street,
          :street2 => member_address.address.street2,
          :post_code => member_address.address.post_code,
          :address_type_id => member_address.address.address_type_id,
          :address_location_type_id => member_address.address.address_location_type_id,
          :country_id => member_address.address.country_id,
          :state_id => member_address.address.state_id,
          :city_id => member_address.address.city_id,
          :is_primary => member_address.is_primary,
          :is_visible => member_address.is_visible,
          :sequence => member_address.sequence,
      })
      countries.push(member_address.address.country) if !countries.any? { |c| c.id === member_address.address.country_id }
      states.push(member_address.address.state) if !states.any? { |c| c.id === member_address.address.state_id }
      cities.push(member_address.address.city) if !cities.any? { |c| c.id === member_address.address.city_id } && member_address.address.city
      address_types.push(member_address.address.address_type) if !address_types.any? { |c| c.id === member_address.address.address_type_id }
      address_location_types.push(member_address.address.address_location_type) if !address_location_types.any? { |c| c.id === member_address.address.address_location_type_id }
    end
    json_response({
        :member_addresses => addresses,
        :countries => countries,
        :states => states,
        :cities => cities,
        :address_types => address_types,
        :address_location_types => address_location_types,
    })
  end

  def update
    @address.update(address_params)
    @member_address.update(member_address_params)
    head :no_content
  end

  def create
    #save address
    @address = Address.create!(address_params)
    #save member address relation
    @member_address = MemberAddress.create!({
      :is_primary => member_address_params[:is_primary],
      :is_visible => member_address_params[:is_visible],
      :address_id => @address.id,
      :member_id  => member_address_params[:member_id],
      :sequence => member_address_params[:sequence]
    })
    head :no_content
  end

  def destroy
    @member_address.destroy()
    head :no_content
  end


  private

  def address_params
    params.require(:member_address).permit(:address_location_type_id, :address_type_id,
      :street, :street2, :post_code, :country_id, :state_id, :city_id)
  end

  def member_address_params
    params.require(:member_address).permit(:is_primary, :is_visible, :sequence, :member_id)
  end

  def set_member
    @member = Member.find(params[:member_id]) if params[:member_id]
  end

  def set_address
    @member_address = MemberAddress.includes(:address).find(params[:id]) if params[:id]
    @address = @member_address.address if @member_address
  end
end
