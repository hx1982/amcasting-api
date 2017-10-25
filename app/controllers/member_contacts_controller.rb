class MemberContactsController < ApplicationController
  before_action :set_member, only: [:index]
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    contacts = [];
    contact_types = [];
    @member_contacts = @member.member_contact.includes(:contact => [:contact_type])
    @member_contacts.each do |member_contact|
      contacts.push({
          :id => member_contact.id,
          :member_id => @member.id,
          :email => member_contact.contact.email,
          :phone => member_contact.contact.phone,
          :is_primary => member_contact.is_primary,
          :is_visible => member_contact.is_visible,
          :sequence => member_contact.sequence,
          :contact_type_id =>  member_contact.contact.contact_type_id
      })
      contact_types.push(member_contact.contact.contact_type) if !contact_types.any? { |ct| ct.id === member_contact.contact.contact_type_id }
    end
    json_response({
        :member_contact => contacts,
        :contact_types => contact_types
    })
  end

  def destroy
    @member_contact.destroy()
    head :no_content
  end

  def update
    @contact.update(contact_params)
    @member_contact.update(member_contact_params)
    head :no_content
    #json_response(@member_contact.to_json(:include => :contact), :ok)
  end

  def create
    #save contact
    @contact = Contact.create!(contact_params)
    #save member contact
    @member_contact = MemberContact.create!({
      :is_primary => member_contact_params[:is_primary],
      :is_visible => member_contact_params[:is_visible],
      :contact_id => @contact.id,
      :member_id  => member_contact_params[:member_id],
      :sequence => member_contact_params[:sequence]
    })

    head :no_content

  end

  private

  def contact_params
    params.require(:member_contact).permit(:email, :phone, :contact_type_id)
  end

  def member_contact_params
    params.require(:member_contact).permit(:is_primary, :is_visible, :sequence, :member_id)
  end

  def set_member
    @member = Member.find(params[:member_id]) if params[:member_id]
  end

  def set_contact
    @member_contact = MemberContact.includes(:contact).find_by!(id: params[:id]) if params[:id]
    @contact = @member_contact.contact if @member_contact
  end
end
