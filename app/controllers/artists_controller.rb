class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  def index
    pp 'artist controler'
    if params[:op].present? && params[:op] === 'queryArtistByMember' && params[:member_id].present?
      queryArtistByMember
    end
  end

  def show
    show_artist
  end

  def update
    # TODO: transaction
    artist_update_params = {
      :dob => DateTime.new(artist_params[:doby], artist_params[:dobm], artist_params[:dobd]),
      :is_dob_visible => artist_params[:is_dob_visible],
      :primary_occupation => artist_params[:primary_occupation],
      :passport_number => artist_params[:passport_number],
      :passport_country_id => artist_params[:passport_country_id],
      :age_from => artist_params[:age_from],
      :age_to => artist_params[:age_to],
      :is_age_range_auto_update => artist_params[:is_age_range_auto_update],
      :is_company_legal_entity => artist_params[:is_company_legal_entity]
    }
    @artist.update!(artist_update_params)
    #update banck account
    bank_account_params = {
      :bank_name => artist_params[:bank_name],
      :bank_swift_code => artist_params[:bank_swift_code],
      :bank_location => artist_params[:bank_location],
      :account_name => artist_params[:account_name],
      :account_number => artist_params[:account_number],
      :bsb => artist_params[:bsb]
    }
    if @artist.bank_account_id.nil?
      @artist.create_bank_account!(bank_account_params)
    else
      @artist.bank_account.update!(bank_account_params)
    end
    #update tax
    tax_params = {
      :juristiction => artist_params[:juristiction],
      :number => artist_params[:tax_number],
      :tax_type_id => artist_params[:tax_type_id]
    }
    if @artist.tax_id.nil?
      @artist.create_tax!(tax_params)
    else
      @artist.tax.update!(tax_params)
    end
    #update company
    company_params = {
      :name => artist_params[:company_name],
      :number => artist_params[:company_number],
      :company_type => artist_params[:company_type]
    }
    if @artist.company_id.nil?
      @artist.create_company!(company_params)
    else
      @artist.company.update!(company_params)
    end
    #update superannuation
    superannuation_params = {
      :company => artist_params[:superannuation_company],
      :number => artist_params[:superannuation_number],
      :social_security_number => artist_params[:social_security_number]
    }
    if @artist.superannuation_id.nil?
      @artist.create_superannuation!(superannuation_params)
    else
      @artist.superannuation.update!(superannuation_params)
    end

    head :no_content
  end

  private

  def queryArtistByMember
    @artist = Artist.find_by member_id: params[:member_id]
    show_artist
  end

  def show_artist
    dob = @artist.dob ? @artist.dob: DateTime.now
    billing_profile = @artist.profile.where(is_billing_profile: true).first
    json_response({
        artist: {
          id: @artist.id,
          doby: dob.year,
          dobm: dob.month,
          dobd: dob.day,
          is_dob_visible: @artist.is_dob_visible,
          primary_occupation: @artist.primary_occupation,
          age_from: @artist.age_from,
          age_to: @artist.age_to,
          is_age_range_auto_update: @artist.is_age_range_auto_update,
          passport_number: @artist.passport_number,
          passport_country_id: @artist.passport_country_id,
          #superannuation
          superannuation_company: (@artist.superannuation ? @artist.superannuation.company : ''),
          superannuation_number: (@artist.superannuation ? @artist.superannuation.number : ''),
          social_security_number: (@artist.superannuation ? @artist.superannuation.social_security_number : ''),
          #tax
          juristiction: (@artist.tax ? @artist.tax.juristiction : '0'),
          tax_number: (@artist.tax ? @artist.tax.number : ''),
          tax_type_id: (@artist.tax ? @artist.tax.tax_type_id : 0),
          #company
          is_company_legal_entity: @artist.is_company_legal_entity,
          company_name: (@artist.company ? @artist.company.name : ''),
          company_number: (@artist.company ? @artist.company.number : ''),
          company_type: (@artist.company ? @artist.company.company_type : ''),
          #bank account info
          bank_name: (@artist.bank_account ? @artist.bank_account.bank_name : ''),
          bank_swift_code: (@artist.bank_account ? @artist.bank_account.bank_swift_code : ''),
          bank_location: (@artist.bank_account ? @artist.bank_account.bank_location : ''),
          account_name: (@artist.bank_account ? @artist.bank_account.account_name : ''),
          account_number: (@artist.bank_account ? @artist.bank_account.account_number : ''),
          bsb: (@artist.bank_account ? @artist.bank_account.bsb : ''),
          #artist city
          artist_city_ids: @artist.artist_city_ids,
          billing_profile_id: (billing_profile ? billing_profile.id : 0)
        },

        artist_city: @artist.artist_city
    })
  end


  def artist_params
    params.require(:artist).permit(:doby, :dobm, :dobd, :primary_occupation, :age_from, :age_to, :is_age_range_auto_update,
     :passport_number, :passport_country_id, :superannuation_company, :superannuation_number, :social_security_number,
     :juristiction, :tax_number, :tax_type_id, :is_company_legal_entity, :company_name, :company_number, :company_type,
     :bank_name, :bank_swift_code, :bank_location, :account_name, :account_number, :bsb)
  end



  def set_artist
    @artist = Artist.includes([:bank_account, :tax, :company, :superannuation]).find(params[:id]) if params[:id]
  end
end
