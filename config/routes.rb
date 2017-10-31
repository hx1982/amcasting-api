Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #authentication
  post 'auth/sign_in', to: 'authentication#authenticate'
  post 'auth/password', to: 'authentication#updatePassword'
  post 'auth/sign_up', to: 'users#create'

  resources :states
  resources :cities
  resources :countries
  resources :skills
  resources :skill_groups
  resources :address_location_types
  resources :address_types
  resources :comp_card_types
  resources :contact_types
  resources :tax_types
  resources :artist_types
  resources :artist_cities
  resources :profile_item_types do
    get 'ethnicities', on: :collection
  end

  resources :members do
  end

  resources :artists do
  end

  resources :member_contacts do
  end
  resources :member_addresses do
  end
  resources :member_socials do
  end

  concern :medium_actions do
    get 'preview', on: :collection
    put 'primary', on: :member
    put 'apply', on: :collection
    put 'resort', on: :collection
  end

  resources :profile_artist_types do
    post 'saveProfileArtistType', on: :collection
  end

  resources :medium_details do
  end
  resources :artist_media do
  end
  resources :profile_photos do
    post 'changeSort', on: :collection
  end
  resources :profile_audios do
    post 'changeSort', on: :collection
  end
  resources :profile_videos do
    post 'changeSort', on: :collection
  end
  resources :profile_skills do
    post 'saveAll', on: :collection
  end
  resources :profile_resumes do
    post 'updateCredit', on: :collection
  end
  resources :profile_items do
    post 'saveStatistics', on: :collection
  end
  resources :profile_comp_cards do
    post 'saveCompCard', on: :collection
  end

  resources :profiles do
  end

  resources :media

  #static uploads

end
