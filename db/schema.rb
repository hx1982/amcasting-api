# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170914111645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_status_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_location_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_location_type_id"
    t.integer  "address_type_id"
    t.string   "street"
    t.string   "street2"
    t.string   "post_code"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["address_location_type_id"], name: "index_addresses_on_address_location_type_id", using: :btree
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id", using: :btree
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["state_id"], name: "index_addresses_on_state_id", using: :btree
  end

  create_table "agencies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "billing_month"
    t.string   "phone"
    t.string   "email"
    t.boolean  "is_active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "artist_cities", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "city_id"
    t.boolean  "is_primary"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_cities_on_artist_id", using: :btree
    t.index ["city_id"], name: "index_artist_cities_on_city_id", using: :btree
  end

  create_table "artist_media", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "medium_id"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_media_on_artist_id", using: :btree
    t.index ["medium_id"], name: "index_artist_media_on_medium_id", using: :btree
  end

  create_table "artist_package_items", force: :cascade do |t|
    t.integer  "artist_package_id"
    t.string   "package_item_type_code"
    t.integer  "count"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["artist_package_id"], name: "index_artist_package_items_on_artist_package_id", using: :btree
  end

  create_table "artist_packages", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "artist_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_packages_on_artist_id", using: :btree
    t.index ["package_id"], name: "index_artist_packages_on_package_id", using: :btree
  end

  create_table "artist_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "plural_name"
    t.string   "description"
    t.string   "sequence"
    t.string   "parent_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "artists", force: :cascade do |t|
    t.datetime "dob"
    t.boolean  "is_dob_visible"
    t.string   "primary_occupation"
    t.integer  "passport_country_id"
    t.string   "passport_number"
    t.integer  "age_from"
    t.integer  "age_to"
    t.boolean  "is_age_range_auto_update"
    t.integer  "member_id"
    t.integer  "company_id"
    t.boolean  "is_company_legal_entity"
    t.integer  "tax_id"
    t.integer  "superannuation_id"
    t.integer  "bank_account_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["bank_account_id"], name: "index_artists_on_bank_account_id", using: :btree
    t.index ["company_id"], name: "index_artists_on_company_id", using: :btree
    t.index ["member_id"], name: "index_artists_on_member_id", using: :btree
    t.index ["superannuation_id"], name: "index_artists_on_superannuation_id", using: :btree
    t.index ["tax_id"], name: "index_artists_on_tax_id", using: :btree
  end

  create_table "audio_details", force: :cascade do |t|
    t.integer  "medium_detail_id"
    t.string   "gender_code"
    t.integer  "age_from"
    t.integer  "age_to"
    t.string   "styles"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["medium_detail_id"], name: "index_audio_details_on_medium_detail_id", using: :btree
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "bank_name"
    t.string   "bank_swift_code"
    t.string   "bank_location"
    t.string   "account_name"
    t.string   "account_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "bsb"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "company_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contact_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "contact_type_id"
    t.index ["contact_type_id"], name: "index_contacts_on_contact_type_id", using: :btree
  end

  create_table "conversions", force: :cascade do |t|
    t.integer  "profile_item_type_id"
    t.string   "profile_item_type_code"
    t.integer  "sequence"
    t.string   "uk_value"
    t.string   "us_value"
    t.string   "eu_value"
    t.string   "au_value"
    t.string   "fr_value"
    t.string   "jp_value"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["profile_item_type_id"], name: "index_conversions_on_profile_item_type_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_code"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "media", force: :cascade do |t|
    t.integer  "medium_type_id"
    t.string   "file_path"
    t.string   "file_name"
    t.string   "file_type"
    t.bigint   "file_size"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.bigint   "duration"
    t.string   "asset"
    t.index ["medium_type_id"], name: "index_media_on_medium_type_id", using: :btree
  end

  create_table "medium_details", force: :cascade do |t|
    t.integer  "medium_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["medium_id"], name: "index_medium_details_on_medium_id", using: :btree
  end

  create_table "medium_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "member_addresses", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "member_id"
    t.boolean  "is_primary"
    t.boolean  "is_visible"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_member_addresses_on_address_id", using: :btree
    t.index ["member_id"], name: "index_member_addresses_on_member_id", using: :btree
  end

  create_table "member_contacts", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "member_id"
    t.boolean  "is_primary"
    t.boolean  "is_visible"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_member_contacts_on_contact_id", using: :btree
    t.index ["member_id"], name: "index_member_contacts_on_member_id", using: :btree
  end

  create_table "member_socials", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "social_type_id"
    t.string   "link"
    t.boolean  "is_visible"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["member_id"], name: "index_member_socials_on_member_id", using: :btree
    t.index ["social_type_id"], name: "index_member_socials_on_social_type_id", using: :btree
  end

  create_table "member_source_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "member_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender_code"
    t.integer  "member_type_id"
    t.integer  "member_source_type_id"
    t.integer  "account_status_type_id"
    t.integer  "user_id"
    t.boolean  "is_active"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email"
    t.string   "phone"
    t.index ["account_status_type_id"], name: "index_members_on_account_status_type_id", using: :btree
    t.index ["member_source_type_id"], name: "index_members_on_member_source_type_id", using: :btree
    t.index ["member_type_id"], name: "index_members_on_member_type_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.boolean  "is_retail_package"
    t.boolean  "is_special_package"
    t.boolean  "is_child_package"
    t.string   "country_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "profile_artist_types", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "artist_type_id"
    t.boolean  "is_primary"
    t.integer  "sequence"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["artist_type_id"], name: "index_profile_artist_types_on_artist_type_id", using: :btree
    t.index ["profile_id"], name: "index_profile_artist_types_on_profile_id", using: :btree
  end

  create_table "profile_audios", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "artist_medium_id"
    t.boolean  "is_primary"
    t.integer  "sequence"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["artist_medium_id"], name: "index_profile_audios_on_artist_medium_id", using: :btree
    t.index ["profile_id"], name: "index_profile_audios_on_profile_id", using: :btree
  end

  create_table "profile_comp_card_items", force: :cascade do |t|
    t.integer  "profile_comp_card_id"
    t.integer  "profile_item_type_id"
    t.integer  "sequence"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["profile_comp_card_id"], name: "index_profile_comp_card_items_on_profile_comp_card_id", using: :btree
    t.index ["profile_item_type_id"], name: "index_profile_comp_card_items_on_profile_item_type_id", using: :btree
  end

  create_table "profile_comp_card_photos", force: :cascade do |t|
    t.integer  "profile_comp_card_id"
    t.integer  "profile_photo_id"
    t.integer  "sequence"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["profile_comp_card_id"], name: "index_profile_comp_card_photos_on_profile_comp_card_id", using: :btree
    t.index ["profile_photo_id"], name: "index_profile_comp_card_photos_on_profile_photo_id", using: :btree
  end

  create_table "profile_comp_cards", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "comp_card_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["profile_id"], name: "index_profile_comp_cards_on_profile_id", using: :btree
  end

  create_table "profile_item_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.string   "gender_code"
    t.string   "age_code"
    t.string   "value_code"
    t.boolean  "is_searchable"
    t.boolean  "is_multiple"
    t.integer  "group"
    t.integer  "sequence"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "profile_item_values", force: :cascade do |t|
    t.integer  "profile_item_id"
    t.integer  "conversion_id"
    t.integer  "profile_value_item_type_value_id"
    t.integer  "value"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["conversion_id"], name: "index_profile_item_values_on_conversion_id", using: :btree
    t.index ["profile_item_id"], name: "index_profile_item_values_on_profile_item_id", using: :btree
    t.index ["profile_value_item_type_value_id"], name: "index_profile_item_values_on_profile_value_item_type_value_id", using: :btree
  end

  create_table "profile_items", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "profile_item_type_id"
    t.string   "profile_item_type_code"
    t.boolean  "is_display"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["profile_id"], name: "index_profile_items_on_profile_id", using: :btree
    t.index ["profile_item_type_id"], name: "index_profile_items_on_profile_item_type_id", using: :btree
  end

  create_table "profile_photos", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "artist_medium_id"
    t.boolean  "is_primary"
    t.integer  "sequence"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["artist_medium_id"], name: "index_profile_photos_on_artist_medium_id", using: :btree
    t.index ["profile_id"], name: "index_profile_photos_on_profile_id", using: :btree
  end

  create_table "profile_range_item_type_values", force: :cascade do |t|
    t.integer  "min"
    t.integer  "max"
    t.integer  "step"
    t.integer  "profile_item_type_id"
    t.string   "profile_item_type_code"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["profile_item_type_id"], name: "index_profile_range_item_type_values_on_profile_item_type_id", using: :btree
  end

  create_table "profile_resumes", force: :cascade do |t|
    t.string   "file_path"
    t.string   "file_name"
    t.string   "description"
    t.boolean  "is_generated_by_credit"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "profile_id"
    t.index ["profile_id"], name: "index_profile_resumes_on_profile_id", using: :btree
  end

  create_table "profile_skills", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "skill_id"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_skills_on_profile_id", using: :btree
    t.index ["skill_id"], name: "index_profile_skills_on_skill_id", using: :btree
  end

  create_table "profile_socials", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "social_type_id"
    t.string   "link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "is_visible"
    t.index ["profile_id"], name: "index_profile_socials_on_profile_id", using: :btree
    t.index ["social_type_id"], name: "index_profile_socials_on_social_type_id", using: :btree
  end

  create_table "profile_value_item_type_values", force: :cascade do |t|
    t.string   "name"
    t.integer  "profile_item_type_id"
    t.string   "profile_item_type_code"
    t.integer  "level1"
    t.integer  "level2"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["profile_item_type_id"], name: "index_profile_value_item_type_values_on_profile_item_type_id", using: :btree
  end

  create_table "profile_videos", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "artist_medium_id"
    t.boolean  "is_primary"
    t.integer  "sequence"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["artist_medium_id"], name: "index_profile_videos_on_artist_medium_id", using: :btree
    t.index ["profile_id"], name: "index_profile_videos_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "artist_id"
    t.boolean  "is_billing_profile"
    t.boolean  "is_active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "agency_id"
    t.index ["agency_id"], name: "index_profiles_on_agency_id", using: :btree
    t.index ["artist_id"], name: "index_profiles_on_artist_id", using: :btree
  end

  create_table "resume_sections", force: :cascade do |t|
    t.integer  "profile_resume_id"
    t.string   "title"
    t.string   "text"
    t.boolean  "is_paragraph"
    t.integer  "column"
    t.integer  "row"
    t.integer  "sequence"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["profile_resume_id"], name: "index_resume_sections_on_profile_resume_id", using: :btree
  end

  create_table "resume_table_cells", force: :cascade do |t|
    t.integer  "resume_section_id"
    t.integer  "row"
    t.integer  "column"
    t.string   "text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["resume_section_id"], name: "index_resume_table_cells_on_resume_section_id", using: :btree
  end

  create_table "resume_table_media", force: :cascade do |t|
    t.integer  "resume_section_id"
    t.integer  "row"
    t.integer  "sequence"
    t.integer  "artist_medium_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["artist_medium_id"], name: "index_resume_table_media_on_artist_medium_id", using: :btree
    t.index ["resume_section_id"], name: "index_resume_table_media_on_resume_section_id", using: :btree
  end

  create_table "skill_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_searchable"
    t.integer  "sequence"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "skill_group_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_searchable"
    t.integer  "sequence"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["skill_group_id"], name: "index_skills_on_skill_group_id", using: :btree
  end

  create_table "social_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.integer  "country_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "superannuations", force: :cascade do |t|
    t.string   "company"
    t.string   "number"
    t.string   "social_security_number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tax_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "juristiction"
    t.string   "number"
    t.integer  "tax_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["tax_type_id"], name: "index_taxes_on_tax_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "addresses", "address_location_types"
  add_foreign_key "addresses", "address_types"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "states"
  add_foreign_key "artist_cities", "artists"
  add_foreign_key "artist_cities", "cities"
  add_foreign_key "artist_media", "artists"
  add_foreign_key "artist_media", "media"
  add_foreign_key "artist_package_items", "artist_packages"
  add_foreign_key "artist_packages", "artists"
  add_foreign_key "artist_packages", "packages"
  add_foreign_key "artists", "bank_accounts"
  add_foreign_key "artists", "companies"
  add_foreign_key "artists", "members"
  add_foreign_key "artists", "superannuations"
  add_foreign_key "artists", "taxes"
  add_foreign_key "audio_details", "medium_details"
  add_foreign_key "cities", "states"
  add_foreign_key "contacts", "contact_types"
  add_foreign_key "conversions", "profile_item_types"
  add_foreign_key "media", "medium_types"
  add_foreign_key "medium_details", "media"
  add_foreign_key "member_addresses", "addresses"
  add_foreign_key "member_addresses", "members"
  add_foreign_key "member_contacts", "contacts"
  add_foreign_key "member_contacts", "members"
  add_foreign_key "member_socials", "members"
  add_foreign_key "member_socials", "social_types"
  add_foreign_key "members", "account_status_types"
  add_foreign_key "members", "member_source_types"
  add_foreign_key "members", "member_types"
  add_foreign_key "members", "users"
  add_foreign_key "profile_artist_types", "artist_types"
  add_foreign_key "profile_artist_types", "profiles"
  add_foreign_key "profile_audios", "artist_media"
  add_foreign_key "profile_audios", "profiles"
  add_foreign_key "profile_comp_card_items", "profile_comp_cards"
  add_foreign_key "profile_comp_card_items", "profile_item_types"
  add_foreign_key "profile_comp_card_photos", "profile_comp_cards"
  add_foreign_key "profile_comp_card_photos", "profile_photos"
  add_foreign_key "profile_comp_cards", "profiles"
  add_foreign_key "profile_item_values", "conversions"
  add_foreign_key "profile_item_values", "profile_items"
  add_foreign_key "profile_item_values", "profile_value_item_type_values"
  add_foreign_key "profile_items", "profile_item_types"
  add_foreign_key "profile_items", "profiles"
  add_foreign_key "profile_photos", "artist_media"
  add_foreign_key "profile_photos", "profiles"
  add_foreign_key "profile_range_item_type_values", "profile_item_types"
  add_foreign_key "profile_resumes", "profiles"
  add_foreign_key "profile_skills", "profiles"
  add_foreign_key "profile_skills", "skills"
  add_foreign_key "profile_socials", "profiles"
  add_foreign_key "profile_socials", "social_types"
  add_foreign_key "profile_value_item_type_values", "profile_item_types"
  add_foreign_key "profile_videos", "artist_media"
  add_foreign_key "profile_videos", "profiles"
  add_foreign_key "profiles", "agencies"
  add_foreign_key "profiles", "artists"
  add_foreign_key "resume_sections", "profile_resumes"
  add_foreign_key "resume_table_cells", "resume_sections"
  add_foreign_key "resume_table_media", "artist_media"
  add_foreign_key "resume_table_media", "resume_sections"
  add_foreign_key "skills", "skill_groups"
  add_foreign_key "states", "countries"
  add_foreign_key "taxes", "tax_types"
end
