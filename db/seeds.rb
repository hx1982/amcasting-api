
#account status type
account_status_type_atrributes = [
  { code: "OK", name: "OK", description:"OK", sequence: 0},
  { code: "NA", name: "Not Applicable", description:"Not Applicable", sequence: 1},
  { code: "PEND", name: "Peding", description:"Account Pending Validation", sequence: 2},
  { code: "RENW", name: "Renew Soon", description:"Renew within 45 days", sequence: 3},
  { code: "URGR", name: "Urgent Renewal", description:"Renew within 15 days", sequence: 4},
  { code: "SUSP", name: "Suspended", description:"Suspended", sequence: 5},
]

account_status_type_atrributes.each do |attributes|
  AccountStatusType.where(attributes).first_or_create
end

#address location type
address_location_type_atrributes = [
  { code: "POST", name: "Postal", description:"Postal", sequence: 0},
  { code: "WORK", name: "Work", description:"Work", sequence: 1},
  { code: "HOME", name: "Home", description:"Home", sequence: 2},
  { code: "GUAR", name: "Guardian", description:"Guardian", sequence: 3},
  { code: "AUPA", name: "Au-Pair", description:"Au-Pair", sequence: 4},
  { code: "MOTH", name: "Mother", description:"Mother", sequence: 5},
  { code: "FATH", name: "Father", description:"Father", sequence: 6},
  { code: "BROT", name: "Brother", description:"Brother", sequence: 7},
  { code: "SIST", name: "Sister", description:"Sister", sequence: 8},
  { code: "AUNT", name: "Auntee", description:"Auntee", sequence: 9},
  { code: "UNCL", name: "Uncle", description:"Uncle", sequence: 10},
  { code: "SPOU", name: "Spouse", description:"Spouse", sequence: 11},
  { code: "OTHE", name: "Other", description:"Other", sequence: 12},
]

address_location_type_atrributes.each do |attributes|
  AddressLocationType.where(attributes).first_or_create
end

#address location type
address_type_atrributes = [
  { code: "PYSI", name: "Pysical", description:"Pysical", sequence: 0},
  { code: "POST", name: "Postal Address", description:"Postal Address", sequence: 1},
  { code: "BILL", name: "Billing Address", description:"Billing Address", sequence: 2},
]

address_type_atrributes.each do |attributes|
  AddressType.where(attributes).first_or_create
end


#member type
member_type_atrributes = [
  { code: "ARTS", name: "Artist", description:"Artist", sequence: 0},
  { code: "ANON", name: "Anonymous", description:"Anonymous", sequence: 1},
  { code: "AWEB", name: "Agency Web Site User", description:"Agency Web Site User", sequence: 2},
  { code: "CLNT", name: "Agency Web Site Client", description:"Agency Web Site Client", sequence: 3},
  { code: "CNOT", name: "I-Cast", description:"I-Cast User", sequence: 4},
  { code: "ENGR", name: "Engager", description:"Engager", sequence: 5},
  { code: "AGNT", name: "Agent", description:"Agent", sequence: 6},
  { code: "AADM", name: "Agency Administrator", description:"Agency Administrator", sequence: 7},
  { code: "SADM", name: "Site Administrator", description:"Site Administrator", sequence: 8},
  { code: "ADMN", name: "Administrator", description:"Administrator", sequence: 9},
]

member_type_atrributes.each do |attributes|
  MemberType.where(attributes).first_or_create
end

#artist type
artist_type_atrributes = [
  { code: "ACTR", name: "Actor", plural_name:'Actors', description:"Actor", sequence: 0},
  { code: "CELE", name: "Celebrity", plural_name:'Celebrities', description:"Celebrity", sequence: 1, parent_code: 'ACTR'},
  { code: "MODL", name: "Model", plural_name:'Models', description:"Model", sequence: 2}
]

artist_type_atrributes.each do |attributes|
  ArtistType.where(attributes).first_or_create
end

#contact type
contact_type_atrributes = [
  { code: "MOBI", name: "Mobile/Cell", description:"Mobile/Cell", sequence: 0},
  { code: "WORK", name: "Work", description:"Work", sequence: 1},
  { code: "HOME", name: "Home", description:"Home", sequence: 2},
  { code: "GUAR", name: "Guardian", description:"Guardian", sequence: 3},
  { code: "AUPA", name: "Au-Pair", description:"Au-Pair", sequence: 4},
  { code: "MOTH", name: "Mother", description:"Mother", sequence: 5},
  { code: "FATH", name: "Father", description:"Father", sequence: 6},
  { code: "BROT", name: "Brother", description:"Brother", sequence: 7},
  { code: "SIST", name: "Sister", description:"Sister", sequence: 8},
  { code: "AUNT", name: "Auntee", description:"Auntee", sequence: 9},
  { code: "UNCL", name: "Uncle", description:"Uncle", sequence: 10},
  { code: "SPOU", name: "Spouse", description:"Spouse", sequence: 11},
  { code: "OTHE", name: "Other", description:"Other", sequence: 12},
]
contact_type_atrributes.each do |attributes|
  ContactType.where(attributes).first_or_create
end
#country
country_atrributes = [
  { country_code: "AU", name: "Australia"},
  { country_code: "NZ", name: "New Zeland"},
]
country_atrributes.each do |attributes|
  Country.where(attributes).first_or_create
end
#state
state_atrributes = [
  { country_code: "AU", country_id: 1, name: "NSW"},
  { country_code: "AU", country_id: 1, name: "VIC"},
]
state_atrributes.each do |attributes|
  State.where(attributes).first_or_create
end
#city
city_atrributes = [
  { state_id: 1, name: "Sunshine Coast"},
  { state_id: 1, name: "Brisbane"},
  { state_id: 2, name: "Victoria"},
]
city_atrributes.each do |attributes|
  City.where(attributes).first_or_create
end
#medium type
medium_type_atrributes = [
  { code: "PHOT", name: "Photo", description:"Photo", sequence: 0},
  { code: "AUD", name: "Audio", description:"Audio", sequence: 2},
  { code: "VID", name: "Video", description:"Video", sequence: 1},
]
medium_type_atrributes.each do |attributes|
  MediumType.where(attributes).first_or_create
end
#member source type
member_source_type_atrributes = [
  { code: "MM", name: "Manager Magic", description:"Manager Magic", sequence: 0},
  { code: "AM", name: "Audition Magic", description:"Audition Magic", sequence: 1},
]
member_source_type_atrributes.each do |attributes|
  MemberSourceType.where(attributes).first_or_create
end
#skill group
skill_group_atrributes = [
  { name: 'Accents', description: 'Accents', is_searchable: true, sequence: 0 },
  { name: 'Languages', description: 'Languages', is_searchable: true, sequence: 1 },
  { name: 'Instrumental', description: 'Instrumental', is_searchable: true, sequence: 2 },
]
skill_group_atrributes.each do |attributes|
  SkillGroup.where(attributes).first_or_create
end
#skill
skill_atrributes = [
  { skill_group_id: 1, name: 'Aboriginal', description: 'Aboriginal', is_searchable: true, sequence: 0 },
  { skill_group_id: 1, name: 'African', description: 'African', is_searchable: true, sequence: 1 },
  { skill_group_id: 1, name: 'Chinese', description: 'Chinese', is_searchable: true, sequence: 2 },
  { skill_group_id: 2, name: 'Aborigine - Australian Aboriginal', description: 'Aborigine - Australian Aboriginal', is_searchable: true, sequence: 0 },
  { skill_group_id: 2, name: 'Aborigine - Inuit', description: 'Aborigine - Inuit', is_searchable: true, sequence: 1 },
  { skill_group_id: 2, name: 'Eastern - Hindi', description: 'Eastern - Hindi', is_searchable: true, sequence: 2 },
  { skill_group_id: 3, name: 'Accordian', description: 'Accordian', is_searchable: true, sequence: 0 },
  { skill_group_id: 3, name: 'Bagpipes', description: 'Bagpipes', is_searchable: true, sequence: 1 },
  { skill_group_id: 3, name: 'Banjo', description: 'Banjo', is_searchable: true, sequence: 2 },
]
skill_atrributes.each do |attributes|
  Skill.where(attributes).first_or_create
end
#tax type
tax_type_atrributes = [
  { code: "INDI", name: "Individual", description:"Individual", sequence: 0},
  { code: "COPO", name: "Coporation", description:"Coporation", sequence: 1},
  { code: "TRUS", name: "Trust", description:"Trust", sequence: 2},
]
tax_type_atrributes.each do |attributes|
  TaxType.where(attributes).first_or_create
end

#package
package_atrributes = [
  { name: "Free Package", price: 0.0, is_retail_package: true, is_special_package: false, is_child_package: false, country_code: ''},
  { name: "Standard Package", price: 99.0, is_retail_package: true, is_special_package: false, is_child_package: false, country_code: ''},
]
package_atrributes.each do |attributes|
  Package.where(attributes).first_or_create
end

#user
user_atrributes = [
  { email: "li@at2.com", password: "4rekeyAJ", password_confirmation:"4rekeyAJ"},
]
user_atrributes.each do |attributes|
  User.first_or_create!(attributes)
end

#member
member_atrributes = [
  {first_name: "Leon", last_name: "Li", gender_code: "MALE",
    member_type_id: 1, account_status_type_id: 1, member_source_type_id: 1,
    user_id: 1, is_active: true, email: "li@at2.com", phone: "13990380407"}
]

member_atrributes.each do |attributes|
  Member.first_or_create!(attributes)
end

#contact
contact_atrributes = [
  {email: 'bayistuta@gmail.com', phone: '13990380407', contact_type_id: 1},
  {email: 'fanfan@gmail.com', phone: '13990301084', contact_type_id: 2},
  {email: 'Jack@gmail.com', phone: '18180313112', contact_type_id: 3},
]

contact_atrributes.each do |attributes|
  Contact.where(attributes).first_or_create
end
#member_contacts
member_contact_atrributes = [
  {
    contact_id: 1, member_id: 1, is_primary: true, is_visible:true, sequence:0
  },
  {
    contact_id: 2, member_id: 1, is_primary: false, is_visible:true, sequence:1
  },
  {
    contact_id: 3, member_id: 1, is_primary: false, is_visible:true, sequence:2
  }
]

member_contact_atrributes.each do |attributes|
  MemberContact.where(attributes).first_or_create
end

#address
address_atrributes = [
  {
    address_location_type_id: 1,
    address_type_id: 1,
    street: 'Bai Po Street',
    street2: '',
    post_code: '40012',
    country_id: 1,
    state_id: 1,
    city_id: 1
  },
  {
    address_location_type_id: 1,
    address_type_id: 1,
    street: 'Tian Fu Street',
    street2: '',
    post_code: '40012',
    country_id: 1,
    state_id: 1,
    city_id: 1
  },
]

address_atrributes.each do |attributes|
  Address.where(attributes).first_or_create
end
#member_addresses
member_address_atrributes = [
  {
    address_id: 1, member_id: 1, is_primary: true, is_visible:true, sequence:0
  },
  {
    address_id: 2, member_id: 1, is_primary: false, is_visible:true, sequence:1
  }
]

member_address_atrributes.each do |attributes|
  MemberAddress.where(attributes).first_or_create
end

#private details
#company
company_atrributes = [
  {
    name: 'at2casting', number: '02110211', company_type: 'casting',
  },
]
company_atrributes.each do |attributes|
  Company.where(attributes).first_or_create
end
#tax
tax_atrributes = [
  {
    juristiction: '1', number: '00000', tax_type_id: 1,
  },
]
tax_atrributes.each do |attributes|
  Tax.where(attributes).first_or_create
end
#superannuation
superannuation_atrributes = [
  {
    company: 'at2casting', number: '00000', social_security_number: '0000',
  },
]
superannuation_atrributes.each do |attributes|
  Superannuation.where(attributes).first_or_create
end
#bank account
bank_account_atrributes = [
  {
    bank_name: 'ANZ', bank_swift_code: '00000', bank_location: 'NSW',
    account_name: 'at2casting', account_number: '1111', bsb: '1111',
  },
]
bank_account_atrributes.each do |attributes|
  BankAccount.where(attributes).first_or_create
end

#artist
artist_atrributes = [
  {
    dob: '1982-04-01',
    is_dob_visible: true,
    primary_occupation: 'Developer',
    passport_country_id:1,
    passport_number: '',
    age_from: 30,
    age_to: 35,
    is_age_range_auto_update: true,
    member_id: 1,
    company_id: 1,
    is_company_legal_entity: true,
    tax_id: 1,
    superannuation_id: 1,
    bank_account_id: 1
  },
]

artist_atrributes.each do |attributes|
  Artist.where(attributes).first_or_create
end
#artist package
artist_package_atrributes = [
  { package_id: 1, artist_id: 1, start_date: '2016-08-19', end_date: '2017-08-19', is_current: true},
]
artist_package_atrributes.each do |attributes|
  ArtistPackage.where(attributes).first_or_create
end

#artist package item
artist_package_item_atrributes = [
  { artist_package_id: 1, package_item_type_code: 'PHOT', count: 5},
  { artist_package_id: 1, package_item_type_code: 'VID', count: 2},
  { artist_package_id: 1, package_item_type_code: 'AUD', count: 2},
]
artist_package_item_atrributes.each do |attributes|
  ArtistPackageItem.where(attributes).first_or_create
end
#artist cities
artist_city_atrributes = [
  { artist_id: 1, city_id: 1, is_primary: true, sequence:0},
  { artist_id: 1, city_id: 2, is_primary: false, sequence:1},
]
artist_city_atrributes.each do |attributes|
  ArtistCity.where(attributes).first_or_create
end

#social type
social_type_atrributes = [
  { code: "FB", name: "FaceBook", description:"FaceBook", sequence: 0},
  { code: "TW", name: "Twitter", description:"Twitter", sequence: 1},
  { code: "INS", name: "Instagram", description:"Instagram", sequence: 2},
  { code: "GP", name: "Google Plus", description:"Google Plus", sequence: 3},
  { code: "PT", name: "Pinterest", description:"Pinterest", sequence: 4},
  { code: "LK", name: "Linked In", description:"Linked In", sequence: 5},
  { code: "SC", name: "Snap Chat", description:"Snap Chat", sequence: 6}
]
social_type_atrributes.each do |attributes|
  SocialType.where(attributes).first_or_create
end
#member social
member_social_atrributes = [
  { member_id: 1, social_type_id: 1, link: 'http://facebook.com/test', is_visible: true}
]
member_social_atrributes.each do |attributes|
  MemberSocial.where(attributes).first_or_create
end

#Agency
agency_atrributes = [
  { name: 'AT2Casting - Test', description: 'at2casting test', billing_month: '0', phone: '400', email: 'admin@at2.com.au', is_active: true},
]

agency_atrributes.each do |attributes|
  Agency.where(attributes).first_or_create
end

#Profile
profile_attributes = [
  {artist_id: 1, is_billing_profile: true, is_active: 1, agency_id: 1}
]

profile_attributes.each do |attributes|
  Profile.where(attributes).first_or_create
end
#Profile artist type
profile_artist_type_attributes = [
  {profile_id: 1, artist_type_id: 1, is_primary: true, sequence: 0},
  {profile_id: 1, artist_type_id: 2, is_primary: false, sequence: 1},
]

profile_artist_type_attributes.each do |attributes|
  ProfileArtistType.where(attributes).first_or_create
end

#media
# media_attributes = [
#   {medium_type_id: 1, file_path: '/assets/images/demo', file_name: '1', file_type: 'jpg', file_size: 0},
#   {medium_type_id: 1, file_path: '/assets/images/demo', file_name: '2', file_type: 'jpg', file_size: 0},
#   {medium_type_id: 1, file_path: '/assets/images/demo', file_name: '3', file_type: 'jpg', file_size: 0},
#   {medium_type_id: 1, file_path: '/assets/images/demo', file_name: '4', file_type: 'jpg', file_size: 0},
#   {medium_type_id: 1, file_path: '/assets/images/demo', file_name: '5', file_type: 'jpg', file_size: 0},
#   {medium_type_id: 1, file_path: '/assets/images/demo', file_name: '6', file_type: 'jpg', file_size: 0},
#   {medium_type_id: 2, file_path: '/assets/images/demo', file_name: '1', file_type: 'mp3', file_size: 0, duration: 200},
#   {medium_type_id: 2, file_path: '/assets/images/demo', file_name: '2', file_type: 'mp3', file_size: 0, duration: 200},
#   {medium_type_id: 2, file_path: '/assets/images/demo', file_name: '3', file_type: 'mp3', file_size: 0, duration: 200},
#   {medium_type_id: 2, file_path: '/assets/images/demo', file_name: '4', file_type: 'mp3', file_size: 0, duration: 200},
#   {medium_type_id: 3, file_path: '/assets/images/demo', file_name: '1', file_type: 'mp4', file_size: 0, duration: 200},
#   {medium_type_id: 3, file_path: '/assets/images/demo', file_name: '2', file_type: 'mp4', file_size: 0, duration: 200},
#   {medium_type_id: 3, file_path: '/assets/images/demo', file_name: '3', file_type: 'mp4', file_size: 0, duration: 200},
#   {medium_type_id: 3, file_path: '/assets/images/demo', file_name: '4', file_type: 'mp4', file_size: 0, duration: 200},
# ]
# media_attributes.each do |attributes|
#   Medium.where(attributes).first_or_create
# end
#
# medium_detail_attributes = [
#   {medium_id: 1, title: 'test1', description: 'test1'},
#   {medium_id: 2, title: 'test2', description: 'test2'},
#   {medium_id: 3, title: 'test3', description: 'test3'},
#   {medium_id: 4, title: 'test4', description: 'test4'},
#   {medium_id: 5, title: 'test5', description: 'test5'},
#   {medium_id: 6, title: 'test6', description: 'test6'},
#   {medium_id: 7, title: 'audio1', description: 'audio1'},
#   {medium_id: 8, title: 'audio2', description: 'audio2'},
#   {medium_id: 9, title: 'audio3', description: 'audio3'},
#   {medium_id: 10, title: 'audio4', description: 'audio4'},
#   {medium_id: 11, title: 'video1', description: 'video1'},
#   {medium_id: 12, title: 'video2', description: 'video2'},
#   {medium_id: 13, title: 'video3', description: 'video3'},
#   {medium_id: 14, title: 'video4', description: 'video4'},
# ]
#
# medium_detail_attributes.each do |attributes|
#   MediumDetail.where(attributes).first_or_create
# end
# #artist media
# artist_media_attributes = [
#   {artist_id: 1, medium_id: 1, sequence: 0},
#   {artist_id: 1, medium_id: 2, sequence: 1},
#   {artist_id: 1, medium_id: 3, sequence: 2},
#   {artist_id: 1, medium_id: 4, sequence: 3},
#   {artist_id: 1, medium_id: 5, sequence: 4},
#   {artist_id: 1, medium_id: 6, sequence: 5},
#   {artist_id: 1, medium_id: 7, sequence: 6},
#   {artist_id: 1, medium_id: 8, sequence: 7},
#   {artist_id: 1, medium_id: 9, sequence: 8},
#   {artist_id: 1, medium_id: 10, sequence: 9},
#   {artist_id: 1, medium_id: 11, sequence: 10},
#   {artist_id: 1, medium_id: 12, sequence: 11},
#   {artist_id: 1, medium_id: 13, sequence: 12},
#   {artist_id: 1, medium_id: 14, sequence: 13}
# ]
# artist_media_attributes.each do |attributes|
#   ArtistMedium.where(attributes).first_or_create
# end
# #Profile profile photo
# profile_photo_attributes = [
#   {profile_id: 1, artist_medium_id: 1, is_primary:true, sequence: 0}
# ]
# profile_photo_attributes.each do |attributes|
#   ProfilePhoto.where(attributes).first_or_create
# end
#Profile profile audio
# profile_audio_attributes = [
#   {profile_id: 1, artist_medium_id: 7, is_primary:true, sequence: 0}
# ]
# profile_audio_attributes.each do |attributes|
#   ProfileAudio.where(attributes).first_or_create
# end
# #Profile profile video
# profile_video_attributes = [
#   {profile_id: 1, artist_medium_id: 11, is_primary:true, sequence: 0}
# ]
# profile_video_attributes.each do |attributes|
#   ProfileVideo.where(attributes).first_or_create
# end
#profile item type
profile_item_type_attributes = [
  {
    code: 'CPLX', name: 'Complexion', description:'Complexion', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: false, sequence: 0, group: 1
  },
  {
    code: 'ETHN', name: 'Ethnicity', description:'Ethnicity', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: true, sequence: 1, group: 1
  },
  {
    code: 'HAIR', name: 'Hair Colour', description:'Hair Colour', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: false, sequence: 2, group: 1
  },
  {
    code: 'HAIL', name: 'Hair Length', description:'Hair Length', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: false, sequence: 3, group: 1
  },
  {
    code: 'EYES', name: 'Eye Colour', description:'Eye Colour', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: false, sequence: 4, group: 1
  },
  {
    code: 'BODM', name: 'Body Type', description:'Male Body Type', gender_code: 'MALE',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: false, sequence: 5, group: 1
  },
  {
    code: 'BODW', name: 'Body Type', description:'Female Body Type', gender_code: 'FEMA',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: false, sequence: 6, group: 1
  },
  {
    code: 'HAIB', name: 'Body Hair Type', description:'Body Hair Type', gender_code: 'MALE',
    age_code: '', value_code: 'VALU', is_searchable: false, is_multiple: true, sequence: 7, group: 1
  },
  {
    code: 'HGHT', name: 'Height', description:'Height', gender_code: '',
    age_code: '', value_code: 'MIMA', is_searchable: true, is_multiple: false, sequence: 0, group: 2
  },
  {
    code: 'WGHT', name: 'Weight', description:'Weight', gender_code: '',
    age_code: '', value_code: 'MIMA', is_searchable: true, is_multiple: false, sequence: 1, group: 2
  },
  {
    code: 'SUTM', name: 'Suit Size', description:'Male Suit Size', gender_code: 'MALE',
    age_code: 'ADLT', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 2, group: 2
  },
  {
    code: 'SUTF', name: 'Suit Size', description:'Female Suit Size', gender_code: 'FEMA',
    age_code: 'ADLT', value_code: 'CONV', is_searchable: false, is_multiple: false, sequence: 3, group: 2
  },
  {
    code: 'DRES', name: 'Dress Size', description:'Dress Size', gender_code: 'FEMA',
    age_code: 'ADLT', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 4, group: 2
  },
  {
    code: 'KIDC', name: 'Clothing', description:'Kids Clothing', gender_code: '',
    age_code: 'KIDS', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 5, group: 2
  },
  {
    code: 'COLL', name: 'Collar', description:'Collar', gender_code: 'MALE',
    age_code: '', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 6, group: 2
  },
  {
    code: 'CHST', name: 'Chest Size', description:'Chest Size', gender_code: 'MALE',
    age_code: '', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 7, group: 2
  },
  {
    code: 'BUST', name: 'Bust Size', description:'Bust Size', gender_code: 'FEMA',
    age_code: '', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 8, group: 2
  },
  {
    code: 'BRAS', name: 'Bra Size', description:'Bra Size', gender_code: 'FEMA',
    age_code: 'ADLT', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 9, group: 2
  },
  {
    code: 'WAIS', name: 'Waist Size', description:'Waist Size', gender_code: '',
    age_code: '', value_code: 'MIMA', is_searchable: true, is_multiple: false, sequence: 10, group: 2
  },
  {
    code: 'HIPS', name: 'Hip Size', description:'Hip Size', gender_code: '',
    age_code: '', value_code: 'MIMA', is_searchable: true, is_multiple: false, sequence: 11, group: 2
  },
  {
    code: 'INSL', name: 'Inside Leg', description:'Inside Leg', gender_code: '',
    age_code: '', value_code: 'MIMA', is_searchable: true, is_multiple: false, sequence: 12, group: 2
  },
  {
    code: 'OUTL', name: 'Outside Leg', description:'Outside Leg', gender_code: '',
    age_code: '', value_code: 'MIMA', is_searchable: true, is_multiple: false, sequence: 13, group: 2
  },
  {
    code: 'SHOW', name: 'Shoe Size', description:'Female Shoe Size', gender_code: 'MALE',
    age_code: 'ADLT', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 14, group: 2
  },
  {
    code: 'SHOM', name: 'Shoe Size', description:'Male Shoe Size', gender_code: 'FEMA',
    age_code: 'ADLT', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 15, group: 2
  },
  {
    code: 'KIDS', name: 'Shoe Size', description:'Kids Shoe Size', gender_code: '',
    age_code: 'KIDS', value_code: 'CONV', is_searchable: true, is_multiple: false, sequence: 16, group: 2
  },
  {
    code: 'UNIO', name: 'Union Members', description:'Union Members', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: true, sequence: 0, group: 3
  },
  {
    code: 'UNIQ', name: 'Union Marks', description:'Union Marks', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: true, sequence: 1, group: 3
  },
  {
    code: 'LICN', name: 'License Held', description:'License Held', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: true, sequence: 2, group: 3
  },
  {
    code: 'DISA', name: 'Disabled Artist', description:'Disabled Artist', gender_code: '',
    age_code: '', value_code: 'VALU', is_searchable: true, is_multiple: true, sequence: 3, group: 3
  },
]

profile_item_type_attributes.each do |attributes|
  ProfileItemType.where(attributes).first_or_create
end

#profile value item type values
profile_value_item_type_value_attributes = [
  { name: 'Fair', profile_item_type_id: 1, profile_item_type_code: 'CPLX', level1: 0,level2: 0,},
  { name: 'Medium', profile_item_type_id: 1, profile_item_type_code: 'CPLX', level1: 0,level2: 1,},
  { name: 'Olive', profile_item_type_id: 1, profile_item_type_code: 'CPLX', level1: 0,level2: 2,},
  { name: 'Caramel', profile_item_type_id: 1, profile_item_type_code: 'CPLX', level1: 0,level2: 3,},
  { name: 'Dark', profile_item_type_id: 1, profile_item_type_code: 'CPLX', level1: 0,level2: 4,},
  { name: 'Amputee', profile_item_type_id: 29, profile_item_type_code: 'DISA', level1: 0,level2: 0,},
  { name: 'Blind', profile_item_type_id: 29, profile_item_type_code: 'DISA', level1: 0,level2: 1,},
  { name: 'Deaf', profile_item_type_id: 29, profile_item_type_code: 'DISA', level1: 0,level2: 2,},
  { name: 'Caucasian', profile_item_type_id: 2, profile_item_type_code: 'ETHN', level1: 1,level2: 0,},
  { name: 'Asian', profile_item_type_id: 2,profile_item_type_code: 'ETHN', level1: 1,level2: 1,},
  { name: 'Middle Eastern', profile_item_type_id: 2, profile_item_type_code: 'ETHN', level1: 1,level2: 2,},
  { name: 'American Indian', profile_item_type_id: 2, profile_item_type_code: 'ETHN', level1: 2,level2: 0,},
  { name: 'Indian', profile_item_type_id: 2, profile_item_type_code: 'ETHN', level1: 2,level2: 1,},
  { name: 'Cambodian', profile_item_type_id: 2, profile_item_type_code: 'ETHN', level1: 2,level2: 2,},
]
profile_value_item_type_value_attributes.each do |attributes|
  ProfileValueItemTypeValue.where(attributes).first_or_create
end

#profile range item type values
profile_range_item_type_value_attributes = [
  { profile_item_type_id: 9, profile_item_type_code: 'HGHT', min:30 , max:215 , step:1 },
]
profile_range_item_type_value_attributes.each do |attributes|
  ProfileRangeItemTypeValue.where(attributes).first_or_create
end
#conversion
conversion_attributes = [
  { profile_item_type_id: 11, profile_item_type_code: 'SUTM', sequence: 0, uk_value: '34', us_value: '34', eu_value: '44', au_value: '34', fr_value: '34', jp_value: 'S'},
  { profile_item_type_id: 11, profile_item_type_code: 'SUTM', sequence: 1, uk_value: '36', us_value: '36', eu_value: '46', au_value: '36', fr_value: '36', jp_value: 'S'},
  { profile_item_type_id: 11, profile_item_type_code: 'SUTM', sequence: 2, uk_value: '38', us_value: '38', eu_value: '48', au_value: '38', fr_value: '38', jp_value: 'M'},
  { profile_item_type_id: 11, profile_item_type_code: 'SUTM', sequence: 3, uk_value: '40', us_value: '40', eu_value: '50', au_value: '40', fr_value: '40', jp_value: 'L'},
  { profile_item_type_id: 11, profile_item_type_code: 'SUTM', sequence: 4, uk_value: '42', us_value: '42', eu_value: '52', au_value: '42', fr_value: '42', jp_value: 'L'},
  { profile_item_type_id: 11, profile_item_type_code: 'SUTM', sequence: 5, uk_value: '44', us_value: '44', eu_value: '54', au_value: '44', fr_value: '44', jp_value: 'LL'},
]
conversion_attributes.each do |attributes|
  Conversion.where(attributes).first_or_create
end
#profile item values
profile_item_attributes = [
  { profile_id: 1, profile_item_type_id: 9, profile_item_type_code: 'HGHT', is_display: true}
]
profile_item_attributes.each do |attributes|
  ProfileItem.where(attributes).first_or_create
end

profile_item_values_attributes = [
  {profile_item_id: 1, value: 165}
]
profile_item_values_attributes.each do |attributes|
  ProfileItemValue.where(attributes).first_or_create
end
#profile skill
profile_skill_attributes = [
  {profile_id: 1, skill_id: 1, level: 1}
]
profile_skill_attributes.each do |attributes|
  ProfileSkill.where(attributes).first_or_create
end

#profile resume
profile_resume_attribetus = [
  { profile_id: 1, file_path: '', file_name: '', description: '', is_generated_by_credit: true}
]
profile_resume_attribetus.each do |attributes|
  ProfileResume.where(attributes).first_or_create
end
#resume section
resume_section_attribetus = [
  { title: 'Test', row: 5, column: 4, sequence: 0, profile_resume_id: 1, is_paragraph: false},
  { title: 'Test2', text: 'hello world', sequence: 1, profile_resume_id: 1, is_paragraph: true}
]
resume_section_attribetus.each do |attributes|
  ResumeSection.where(attributes).first_or_create
end

#resume table cell
resume_table_cell_attribetus = [
  { text: 'test', column: 0, row: 0, resume_section_id: 1 },
]
resume_table_cell_attribetus.each do |attributes|
  ResumeTableCell.where(attributes).first_or_create
end
#resume table medium
resume_table_medium_attribetus = [
  { row: 0, sequence: 0, resume_section_id: 1, artist_medium_id: 1 },
]
resume_table_medium_attribetus.each do |attributes|
  ResumeTableMedium.where(attributes).first_or_create
end
#profile comp card
profile_comp_card_attribetus = [
  { profile_id: 1, comp_card_type: 2},
]
profile_comp_card_attribetus.each do |attributes|
  ProfileCompCard.where(attributes).first_or_create
end
#profile comp card photos
profile_comp_card_photo_attribetus = [
  { profile_comp_card_id: 1, profile_photo_id: 1, sequence: 0},
  { profile_comp_card_id: 1, profile_photo_id: 1, sequence: 1},
  { profile_comp_card_id: 1, profile_photo_id: 1, sequence: 2},
  { profile_comp_card_id: 1, profile_photo_id: 1, sequence: 3},
  { profile_comp_card_id: 1, profile_photo_id: 1, sequence: 4},
  { profile_comp_card_id: 1, profile_photo_id: 1, sequence: 5}
]
profile_comp_card_photo_attribetus.each do |attributes|
  ProfileCompCardPhoto.where(attributes).first_or_create
end
#profile comp card item
profile_comp_card_item_attribetus = [
  { profile_comp_card_id: 1, profile_item_type_id: 1, sequence: 0},
  { profile_comp_card_id: 1, profile_item_type_id: 2, sequence: 1},
  { profile_comp_card_id: 1, profile_item_type_id: 3, sequence: 2},
]
profile_comp_card_item_attribetus.each do |attributes|
  ProfileCompCardItem.where(attributes).first_or_create
end
