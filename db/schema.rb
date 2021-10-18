# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_18_084232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "tablefunc"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "aknamed_role_permissions", force: :cascade do |t|
    t.integer "aknamed_role_id"
    t.integer "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["aknamed_role_id", "tenant_id"], name: "index_aknamed_role_permissions_on_aknamed_role_id_and_tenant_id"
    t.index ["permission_id", "tenant_id"], name: "index_aknamed_role_permissions_on_permission_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_aknamed_role_permissions_on_tenant_id"
  end

  create_table "aknamed_roles", force: :cascade do |t|
    t.string "portal"
    t.string "role_type"
    t.string "name"
    t.float "ranking"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["created_by_id"], name: "index_aknamed_roles_on_created_by_id"
    t.index ["deleted_at"], name: "index_aknamed_roles_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_aknamed_roles_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_aknamed_roles_on_tenant_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.string "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_banks_on_deleted_at"
    t.index ["tenant_id"], name: "index_banks_on_tenant_id"
  end

  create_table "branch_sales_rc_uploads", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "sales_rc_upload_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.datetime "deleted_at"
    t.index ["branch_id", "tenant_id"], name: "index_branch_sales_rc_uploads_on_branch_id_and_tenant_id"
    t.index ["sales_rc_upload_id", "tenant_id"], name: "index_branch_sales_rc_uploads_on_src_and_tenant"
    t.index ["tenant_id"], name: "index_branch_sales_rc_uploads_on_tenant_id"
  end

  create_table "branch_sales_rcs", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "sales_rate_contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.datetime "deleted_at"
    t.index ["branch_id", "tenant_id"], name: "index_branch_sales_rcs_on_branch_id_and_tenant_id"
    t.index ["sales_rate_contract_id", "tenant_id"], name: "index_branch_sales_rcs_on_sales_rate_contract_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_branch_sales_rcs_on_tenant_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "source_type"
    t.bigint "source_id"
    t.string "name"
    t.integer "size"
    t.string "branch_manager"
    t.string "phone_number"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "deleted_at"
    t.datetime "last_verified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.integer "parties_count", default: 0
    t.integer "purchase_orders_count", default: 0
    t.integer "purchase_invoices_count", default: 0
    t.integer "sales_orders_count", default: 0
    t.integer "sales_invoices_count", default: 0
    t.integer "rate_contract_uploads_count", default: 0
    t.integer "rate_contracts_count", default: 0
    t.integer "taxes_count", default: 0
    t.integer "tax_uploads_count", default: 0
    t.string "legal_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "pincode"
    t.string "dl_number"
    t.string "gst_number"
    t.string "invoice_code"
    t.integer "invoice_serial_number_counter"
    t.string "email"
    t.bigint "state_id"
    t.integer "dispatches_count"
    t.bigint "created_by_id"
    t.bigint "deleted_by_id"
    t.bigint "last_updated_by_id"
    t.string "fssai_number"
    t.integer "region_id"
    t.integer "grn_serial_number_counter"
    t.integer "tenant_id", null: false
    t.string "pan_number"
    t.string "nl_number"
    t.date "fssai_expiry"
    t.date "dl_expiry"
    t.date "nl_expiry"
    t.string "company_legal_name"
    t.string "cin"
    t.string "registered_office_address"
    t.string "retail_invoice_code"
    t.integer "retail_invoice_counter"
    t.string "sap_code"
    t.string "buying_company"
    t.string "user_name"
    t.string "logistics_area_id"
    t.integer "manual_debit_note_counter", default: 1
    t.string "msme_number"
    t.date "msme_expiry"
    t.string "schedulex_number"
    t.date "schedulex_expiry"
    t.string "dtp_invoice_code"
    t.bigint "pincode_id"
    t.integer "manual_credit_note_counter", default: 1
    t.bigint "universal_pincode_id"
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["created_by_id"], name: "index_branches_on_created_by_id"
    t.index ["deleted_at"], name: "index_branches_on_deleted_at"
    t.index ["deleted_by_id"], name: "index_branches_on_deleted_by_id"
    t.index ["id", "tenant_id"], name: "index_branches_on_id_and_tenant"
    t.index ["last_updated_by_id"], name: "index_branches_on_last_updated_by_id"
    t.index ["pincode_id"], name: "index_branches_on_pincode_id"
    t.index ["source_type", "source_id", "tenant_id"], name: "index_branches_on_source_type_and_source_id_and_tenant_id"
    t.index ["state_id"], name: "index_branches_on_state_id"
    t.index ["tenant_id"], name: "index_branches_on_tenant_id"
    t.index ["universal_pincode_id"], name: "index_branches_on_universal_pincode_id"
  end

  create_table "bulk_product_uploads", force: :cascade do |t|
    t.string "file_name"
    t.string "status", default: "draft", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.boolean "enabled_for_transaction_only", default: false
    t.index ["created_by_id"], name: "index_bulk_product_uploads_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_bulk_product_uploads_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_bulk_product_uploads_on_tenant_id"
  end

  create_table "bulk_quotations", force: :cascade do |t|
    t.string "order_number"
    t.bigint "hospital_id"
    t.json "data"
    t.string "request_name"
    t.integer "total_products"
    t.integer "total_quantity"
    t.datetime "deleted_at"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_bulk_quotations_on_deleted_at"
    t.index ["hospital_id"], name: "index_bulk_quotations_on_hospital_id"
    t.index ["tenant_id"], name: "index_bulk_quotations_on_tenant_id"
  end

  create_table "bulk_sku_uploads", force: :cascade do |t|
    t.string "file_name"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.string "status", default: "draft"
    t.index ["created_by_id"], name: "index_bulk_sku_uploads_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_bulk_sku_uploads_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_bulk_sku_uploads_on_tenant_id"
  end

  create_table "bulk_universal_sku_uploads", force: :cascade do |t|
    t.string "file_name"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "draft"
    t.index ["created_by_id"], name: "index_bulk_universal_sku_uploads_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_bulk_universal_sku_uploads_on_last_updated_by_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["tenant_id"], name: "index_categories_on_tenant_id"
  end

  create_table "challan_return_items", force: :cascade do |t|
    t.bigint "challan_return_id"
    t.bigint "delivery_challan_item_id"
    t.bigint "master_sku_id"
    t.string "product_name"
    t.string "notes"
    t.string "batch_number", null: false
    t.date "batch_expiry", null: false
    t.integer "quantity", null: false
    t.float "rate", null: false
    t.float "mrp", null: false
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.integer "tenant_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challan_return_id", "delivery_challan_item_id", "tenant_id"], name: "index_dc_item_challan_item_and_tenant", unique: true
    t.index ["challan_return_id"], name: "index_challan_return_items_on_challan_return_id"
    t.index ["created_by_id"], name: "index_challan_return_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_challan_return_items_on_deleted_at"
    t.index ["delivery_challan_item_id"], name: "index_challan_return_items_on_delivery_challan_item_id"
    t.index ["last_updated_by_id"], name: "index_challan_return_items_on_last_updated_by_id"
    t.index ["master_sku_id"], name: "index_challan_return_items_on_master_sku_id"
    t.index ["tenant_id"], name: "index_challan_return_items_on_tenant_id"
  end

  create_table "challan_returns", force: :cascade do |t|
    t.bigint "delivery_challan_id"
    t.bigint "branch_id"
    t.datetime "return_date", default: -> { "CURRENT_DATE" }, null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.integer "tenant_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_challan_returns_on_branch_id"
    t.index ["created_by_id"], name: "index_challan_returns_on_created_by_id"
    t.index ["deleted_at"], name: "index_challan_returns_on_deleted_at"
    t.index ["delivery_challan_id", "tenant_id"], name: "index_challan_returns_on_delivery_challan_id_and_tenant_id", unique: true
    t.index ["delivery_challan_id"], name: "index_challan_returns_on_delivery_challan_id"
    t.index ["last_updated_by_id"], name: "index_challan_returns_on_last_updated_by_id"
    t.index ["return_date"], name: "index_challan_returns_on_return_date"
    t.index ["tenant_id"], name: "index_challan_returns_on_tenant_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.string "alt_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hospitals_count", default: 0
    t.integer "master_companies_count", default: 0
    t.integer "branches_count", default: 0
    t.integer "suppliers_count", default: 0
    t.integer "users_count", default: 0
    t.bigint "state_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.bigint "universal_city_id"
    t.index ["created_by_id"], name: "index_cities_on_created_by_id"
    t.index ["deleted_at"], name: "index_cities_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_cities_on_last_updated_by_id"
    t.index ["name"], name: "index_cities_on_name"
    t.index ["state_id"], name: "index_cities_on_state_id"
    t.index ["tenant_id"], name: "index_cities_on_tenant_id"
    t.index ["universal_city_id"], name: "index_cities_on_universal_city_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.index ["commentable_id", "commentable_type", "tenant_id"], name: "index_comments_on_tenant"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
    t.index ["tenant_id"], name: "index_comments_on_tenant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "company_division_accesses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "master_company_id"
    t.string "company_division_name"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_company_id"], name: "index_company_division_accesses_on_master_company_id"
    t.index ["tenant_id"], name: "index_company_division_accesses_on_tenant_id"
    t.index ["user_id"], name: "index_company_division_accesses_on_user_id"
  end

  create_table "company_partner_branches", force: :cascade do |t|
    t.bigint "company_partner_id"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.datetime "deleted_at"
    t.index ["branch_id"], name: "index_company_partner_branches_on_branch_id"
    t.index ["company_partner_id"], name: "index_company_partner_branches_on_company_partner_id"
    t.index ["tenant_id"], name: "index_company_partner_branches_on_tenant_id"
  end

  create_table "company_partners", force: :cascade do |t|
    t.bigint "master_company_id"
    t.bigint "supplier_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.datetime "deleted_at"
    t.boolean "all_branches", default: false
    t.boolean "all_divisions", default: false
    t.index ["created_by_id"], name: "index_company_partners_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_company_partners_on_last_updated_by_id"
    t.index ["master_company_id"], name: "index_company_partners_on_master_company_id"
    t.index ["supplier_id"], name: "index_company_partners_on_supplier_id"
    t.index ["tenant_id"], name: "index_company_partners_on_tenant_id"
  end

  create_table "credit_note_items", force: :cascade do |t|
    t.bigint "credit_note_id"
    t.bigint "master_sku_id"
    t.integer "quantity"
    t.integer "free_quantity"
    t.string "uom"
    t.string "batch_number"
    t.date "batch_expiry"
    t.float "mrp"
    t.float "rate"
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.float "discount_rate"
    t.float "discount_amount"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_credit_note_items_on_created_by_id"
    t.index ["credit_note_id"], name: "index_credit_note_items_on_credit_note_id"
    t.index ["deleted_at"], name: "index_credit_note_items_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_credit_note_items_on_last_updated_by_id"
    t.index ["master_sku_id"], name: "index_credit_note_items_on_master_sku_id"
    t.index ["tenant_id"], name: "index_credit_note_items_on_tenant_id"
  end

  create_table "credit_notes", force: :cascade do |t|
    t.string "buyer_party_type"
    t.bigint "buyer_party_id"
    t.bigint "branch_id"
    t.string "status", default: "draft", null: false
    t.string "sales_invoice_number"
    t.string "return_number"
    t.string "credit_note_number"
    t.date "customer_document_date", default: -> { "CURRENT_DATE" }, null: false
    t.date "credit_note_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "logistic_paid_by"
    t.float "logistic_cost"
    t.integer "total_quantity"
    t.float "total_net_amount"
    t.float "total_tax_amount"
    t.float "total_amount"
    t.integer "items_count", default: 0, null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.bigint "order_type_id"
    t.bigint "confirmed_by_id"
    t.datetime "confirmed_at"
    t.integer "tenant_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_credit_notes_on_branch_id"
    t.index ["buyer_party_type", "buyer_party_id"], name: "index_credit_notes_on_buyer_party_type_and_buyer_party_id"
    t.index ["confirmed_at"], name: "index_credit_notes_on_confirmed_at"
    t.index ["confirmed_by_id"], name: "index_credit_notes_on_confirmed_by_id"
    t.index ["created_by_id"], name: "index_credit_notes_on_created_by_id"
    t.index ["credit_note_date"], name: "index_credit_notes_on_credit_note_date"
    t.index ["customer_document_date"], name: "index_credit_notes_on_customer_document_date"
    t.index ["deleted_at"], name: "index_credit_notes_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_credit_notes_on_last_updated_by_id"
    t.index ["order_type_id"], name: "index_credit_notes_on_order_type_id"
    t.index ["tenant_id"], name: "index_credit_notes_on_tenant_id"
  end

  create_table "dc_item_masters", force: :cascade do |t|
    t.bigint "delivery_challan_item_id"
    t.jsonb "master_sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.index ["delivery_challan_item_id", "tenant_id"], name: "index_dc_item_masters_on_delivery_challan_item_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_dc_item_masters_on_tenant_id"
  end

  create_table "dc_masters", force: :cascade do |t|
    t.bigint "delivery_challan_id"
    t.jsonb "buyer_party"
    t.jsonb "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.index ["delivery_challan_id", "tenant_id"], name: "index_dc_masters_on_delivery_challan_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_dc_masters_on_tenant_id"
  end

  create_table "debit_note_items", force: :cascade do |t|
    t.bigint "debit_note_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "quantity"
    t.string "batch_number"
    t.date "batch_expiry"
    t.float "rate"
    t.float "billed_rate"
    t.float "rate_difference"
    t.float "mrp"
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cash_discount_amount"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.float "net_amount"
    t.bigint "branch_id"
    t.index ["branch_id"], name: "index_debit_note_items_on_branch_id"
    t.index ["created_by_id"], name: "index_debit_note_items_on_created_by_id"
    t.index ["debit_note_id"], name: "index_debit_note_items_on_debit_note_id"
    t.index ["deleted_at"], name: "index_debit_note_items_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_debit_note_items_on_last_updated_by_id"
    t.index ["master_sku_id"], name: "index_debit_note_items_on_master_sku_id"
    t.index ["tenant_id"], name: "index_debit_note_items_on_tenant_id"
  end

  create_table "debit_notes", force: :cascade do |t|
    t.string "supplier_party_type"
    t.bigint "supplier_party_id"
    t.bigint "branch_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "purchase_invoice_number"
    t.string "grn_number"
    t.string "debit_note_number"
    t.string "debit_note_type"
    t.date "debit_note_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.boolean "apply_gst"
    t.float "total_amount"
    t.integer "total_quantity"
    t.bigint "confirmed_by_id"
    t.datetime "confirmed_at"
    t.float "total_net_amount"
    t.float "total_tax_amount"
    t.bigint "order_type_id"
    t.string "display_number"
    t.index ["branch_id"], name: "index_debit_notes_on_branch_id"
    t.index ["confirmed_by_id"], name: "index_debit_notes_on_confirmed_by_id"
    t.index ["created_by_id"], name: "index_debit_notes_on_created_by_id"
    t.index ["debit_note_date"], name: "index_debit_notes_on_debit_note_date"
    t.index ["deleted_at"], name: "index_debit_notes_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_debit_notes_on_last_updated_by_id"
    t.index ["order_type_id"], name: "index_debit_notes_on_order_type_id"
    t.index ["supplier_party_type", "supplier_party_id"], name: "index_debit_notes_on_supplier_party_type_and_supplier_party_id"
    t.index ["tenant_id"], name: "index_debit_notes_on_tenant_id"
  end

  create_table "delivery_challan_items", force: :cascade do |t|
    t.bigint "delivery_challan_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "product_name"
    t.string "notes"
    t.string "batch_number"
    t.date "batch_expiry"
    t.integer "quantity", null: false
    t.float "rate", null: false
    t.float "mrp", null: false
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "actual_quantity"
    t.integer "pending_quantity", default: 0
    t.integer "invoiced_quantity", default: 0
    t.integer "returned_quantity", default: 0
    t.bigint "sales_order_item_id"
    t.integer "tenant_id", null: false
    t.date "manufacturing_date"
    t.string "uom"
    t.float "discount_amount"
    t.float "discount_rate"
    t.index ["created_by_id"], name: "index_delivery_challan_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_delivery_challan_items_on_deleted_at"
    t.index ["delivery_challan_id", "tenant_id"], name: "index_delivery_challan_items_on_challan_id_and_tenant"
    t.index ["last_updated_by_id"], name: "index_delivery_challan_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_delivery_challan_items_on_master_sku_id_and_tenant_id"
    t.index ["sales_order_item_id", "tenant_id"], name: "index_delivery_challan_items_on_soi_and_tenant"
    t.index ["tenant_id"], name: "index_delivery_challan_items_on_tenant_id"
  end

  create_table "delivery_challans", force: :cascade do |t|
    t.string "buyer_party_type"
    t.bigint "buyer_party_id"
    t.bigint "branch_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "dc_number"
    t.date "challan_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.string "dc_type", default: "regular", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patient_no"
    t.string "patient_name"
    t.string "doctor_name"
    t.string "po_number"
    t.bigint "city_id"
    t.bigint "state_id"
    t.boolean "hospital_address", default: true
    t.string "pincode"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "landmark"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.integer "total_pending_quantity", default: 0
    t.integer "tenant_id", null: false
    t.datetime "opened_at"
    t.bigint "pincode_id"
    t.bigint "universal_pincode_id"
    t.index ["branch_id"], name: "index_delivery_challans_on_branch_id"
    t.index ["buyer_party_type", "buyer_party_id", "tenant_id"], name: "index_delivery_challan_on_buyer_and_tenant"
    t.index ["challan_date"], name: "index_delivery_challans_on_challan_date"
    t.index ["city_id"], name: "index_delivery_challans_on_city_id"
    t.index ["created_by_id"], name: "index_delivery_challans_on_created_by_id"
    t.index ["deleted_at"], name: "index_delivery_challans_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_delivery_challans_on_last_updated_by_id"
    t.index ["pincode_id"], name: "index_delivery_challans_on_pincode_id"
    t.index ["state_id"], name: "index_delivery_challans_on_state_id"
    t.index ["tenant_id"], name: "index_delivery_challans_on_tenant_id"
    t.index ["universal_pincode_id"], name: "index_delivery_challans_on_universal_pincode_id"
  end

  create_table "dispatch_delivery_challans", force: :cascade do |t|
    t.bigint "dispatch_id"
    t.bigint "delivery_challan_id"
    t.string "status", default: "dispatched"
    t.string "eway_bill_number"
    t.datetime "deleted_at"
    t.datetime "delivery_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.string "time_slot"
    t.jsonb "dispatch_temperature_data"
    t.jsonb "delivery_temperature_data"
    t.index ["delivery_challan_id", "tenant_id"], name: "index_dispatch_delivery_challan_on_challan_id_and_tenant"
    t.index ["dispatch_id", "tenant_id"], name: "index_dispatch_delivery_challans_on_dispatch_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_dispatch_delivery_challans_on_tenant_id"
  end

  create_table "dispatch_sales_invoices", force: :cascade do |t|
    t.bigint "dispatch_id"
    t.bigint "sales_invoice_id"
    t.datetime "delivery_time"
    t.string "status", default: "dispatched", null: false
    t.string "eway_bill_number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.string "time_slot"
    t.jsonb "dispatch_temperature_data"
    t.jsonb "delivery_temperature_data"
    t.index ["deleted_at"], name: "index_dispatch_sales_invoices_on_deleted_at"
    t.index ["dispatch_id", "tenant_id"], name: "index_dispatch_sales_invoices_on_dispatch_id_and_tenant_id"
    t.index ["sales_invoice_id", "tenant_id"], name: "index_dispatch_sales_invoices_on_sales_invoice_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_dispatch_sales_invoices_on_tenant_id"
  end

  create_table "dispatches", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.bigint "driver_id"
    t.bigint "delivery_executive_id"
    t.bigint "branch_id"
    t.datetime "dispatch_time"
    t.string "status", default: "confirmed", null: false
    t.string "consolidated_eway_bill_number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sales_invoices_count"
    t.string "dispatch_type"
    t.string "transporter_name"
    t.string "lr_number"
    t.date "lr_date"
    t.datetime "delivery_date_time"
    t.integer "tenant_id", null: false
    t.string "dispatch_number"
    t.string "time_slot"
    t.string "picker_name"
    t.string "picker_mobile"
    t.string "eway_bill_no"
    t.jsonb "eway_bill_response", default: {}
    t.index ["branch_id", "tenant_id"], name: "index_dispatches_on_branch_id_and_tenant_id"
    t.index ["deleted_at"], name: "index_dispatches_on_deleted_at"
    t.index ["delivery_executive_id", "tenant_id"], name: "index_dispatches_on_delivery_executive_id_and_tenant_id"
    t.index ["driver_id", "tenant_id"], name: "index_dispatches_on_driver_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_dispatches_on_tenant_id"
    t.index ["vehicle_id", "tenant_id"], name: "index_dispatches_on_vehicle_id_and_tenant_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "contact_number"
    t.integer "dispatches_count"
    t.bigint "branch_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["branch_id", "tenant_id"], name: "index_drivers_on_branch_id_and_tenant_id"
    t.index ["deleted_at"], name: "index_drivers_on_deleted_at"
    t.index ["tenant_id"], name: "index_drivers_on_tenant_id"
  end

  create_table "dtp_groups", force: :cascade do |t|
    t.string "name"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_dtp_groups_on_created_by_id"
    t.index ["deleted_at"], name: "index_dtp_groups_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_dtp_groups_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_dtp_groups_on_tenant_id"
  end

  create_table "event_messages", force: :cascade do |t|
    t.string "parent_model"
    t.string "parent_id"
    t.string "tenant_id"
    t.boolean "success", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_type", default: "SAP"
    t.string "action_type"
    t.index ["deleted_at"], name: "index_event_messages_on_deleted_at"
    t.index ["tenant_id"], name: "index_event_messages_on_tenant_id"
  end

  create_table "excel_uploads", force: :cascade do |t|
    t.string "uploadable_type"
    t.bigint "uploadable_id"
    t.bigint "import_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["import_file_id", "tenant_id"], name: "index_excel_uploads_on_import_file_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_excel_uploads_on_tenant_id"
    t.index ["uploadable_type", "uploadable_id", "tenant_id"], name: "index_excel_upload_on_uploadable_and_tenant"
  end

  create_table "features", force: :cascade do |t|
    t.bigint "aknamed_role_id"
    t.string "name"
    t.string "access"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["aknamed_role_id", "tenant_id"], name: "index_features_on_aknamed_role_id_and_tenant_id"
    t.index ["created_by_id"], name: "index_features_on_created_by_id"
    t.index ["deleted_at"], name: "index_features_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_features_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_features_on_tenant_id"
  end

  create_table "flipper_features", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_flipper_features_on_key", unique: true
  end

  create_table "flipper_gates", force: :cascade do |t|
    t.string "feature_key", null: false
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_key", "key", "value"], name: "index_flipper_gates_on_feature_key_and_key_and_value", unique: true
  end

  create_table "get_quotes", force: :cascade do |t|
    t.boolean "status"
    t.integer "quantity"
    t.bigint "user_id"
    t.bigint "master_sku_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_name"
    t.integer "tenant_id", null: false
    t.index ["master_sku_id", "tenant_id"], name: "index_get_quotes_on_master_sku_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_get_quotes_on_tenant_id"
    t.index ["user_id"], name: "index_get_quotes_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "security_check", default: false
    t.integer "tenant_id", null: false
    t.datetime "deleted_at"
    t.bigint "universal_group_id"
    t.index ["tenant_id"], name: "index_groups_on_tenant_id"
    t.index ["universal_group_id"], name: "index_groups_on_universal_group_id"
  end

  create_table "hospital_entities", force: :cascade do |t|
    t.string "legal_name"
    t.bigint "tenant_id"
    t.bigint "group_id"
    t.datetime "deleted_at"
    t.integer "hospitals_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "deleted_by_id"
    t.bigint "city_id"
    t.bigint "state_id"
    t.bigint "universal_hospital_entity_id"
    t.index ["city_id"], name: "index_hospital_entities_on_city_id"
    t.index ["created_by_id"], name: "index_hospital_entities_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_hospital_entities_on_deleted_by_id"
    t.index ["group_id"], name: "index_hospital_entities_on_group_id"
    t.index ["state_id"], name: "index_hospital_entities_on_state_id"
    t.index ["tenant_id"], name: "index_hospital_entities_on_tenant_id"
    t.index ["universal_hospital_entity_id"], name: "index_hospital_entities_on_universal_hospital_entity_id"
    t.index ["updated_by_id"], name: "index_hospital_entities_on_updated_by_id"
  end

  create_table "hospital_grn_items", force: :cascade do |t|
    t.bigint "hospital_grn_id"
    t.bigint "sales_invoice_item_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "product_name"
    t.string "notes"
    t.string "batch_number"
    t.date "batch_expiry"
    t.integer "quantity", null: false
    t.float "rate", null: false
    t.float "mrp", null: false
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.float "discount_rate"
    t.integer "free_quantity"
    t.float "discount_amount"
    t.float "cumulative_discount_amount", default: 0.0, null: false
    t.float "cumulative_discount_percentage", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delivered_quantity"
    t.string "unit_of_measurement"
    t.string "hsn_code"
    t.integer "tenant_id", null: false
    t.index ["created_by_id"], name: "index_hospital_grn_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_hospital_grn_items_on_deleted_at"
    t.index ["hospital_grn_id", "tenant_id"], name: "index_hospital_grn_items_on_hospital_grn_id_and_tenant_id"
    t.index ["last_updated_by_id"], name: "index_hospital_grn_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_hospital_grn_items_on_master_sku_id_and_tenant_id"
    t.index ["sales_invoice_item_id", "tenant_id"], name: "index_hospital_grn_items_on_sales_invoice_item_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_hospital_grn_items_on_tenant_id"
  end

  create_table "hospital_grns", force: :cascade do |t|
    t.string "buyer_party_type"
    t.bigint "buyer_party_id"
    t.bigint "branch_id"
    t.bigint "sales_invoice_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "invoice_number"
    t.date "invoice_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.float "cumulative_percentage", default: 0.0
    t.boolean "mask_line_item_discount", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["branch_id", "tenant_id"], name: "index_hospital_grns_on_branch_id_and_tenant_id"
    t.index ["buyer_party_type", "buyer_party_id", "tenant_id"], name: "index_hospital_grns_on_byuer_and_tenant"
    t.index ["created_by_id"], name: "index_hospital_grns_on_created_by_id"
    t.index ["deleted_at"], name: "index_hospital_grns_on_deleted_at"
    t.index ["invoice_date"], name: "index_hospital_grns_on_invoice_date"
    t.index ["last_updated_by_id"], name: "index_hospital_grns_on_last_updated_by_id"
    t.index ["sales_invoice_id", "tenant_id"], name: "index_hospital_grns_on_sales_invoice_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_hospital_grns_on_tenant_id"
  end

  create_table "hospital_master_informations", force: :cascade do |t|
    t.bigint "hospital_master_id"
    t.float "mrp"
    t.float "rate"
    t.float "tax"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.index ["hospital_master_id", "tenant_id"], name: "index_hospital_master_informations_on_hospital_and_tenant"
    t.index ["tenant_id"], name: "index_hospital_master_informations_on_tenant_id"
  end

  create_table "hospital_masters", force: :cascade do |t|
    t.bigint "hospital_id"
    t.string "product_name"
    t.string "product_code"
    t.bigint "master_sku_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "manufacturer"
    t.string "group_name"
    t.bigint "group_id"
    t.float "mrp"
    t.boolean "save_for_later", default: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "mapped_by_id"
    t.datetime "mapped_at"
    t.string "status", default: "unmapped"
    t.integer "tenant_id", null: false
    t.string "sub_category"
    t.boolean "product_code_verified", default: false
    t.index ["created_by_id"], name: "index_hospital_masters_on_created_by_id"
    t.index ["group_id", "tenant_id"], name: "index_hospital_masters_on_group_id_and_tenant_id"
    t.index ["hospital_id", "tenant_id"], name: "index_hospital_masters_on_hospital_id_and_tenant_id"
    t.index ["mapped_by_id"], name: "index_hospital_masters_on_mapped_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_hospital_masters_on_master_sku_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_hospital_masters_on_tenant_id"
    t.index ["updated_by_id"], name: "index_hospital_masters_on_updated_by_id"
  end

  create_table "hospital_payment_hospitals", force: :cascade do |t|
    t.bigint "hospital_id"
    t.bigint "hospital_payment_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["hospital_id", "tenant_id"], name: "index_hospital_payment_hospitals_on_hospital_id_and_tenant_id"
    t.index ["hospital_payment_id", "tenant_id"], name: "index_hospital_payment_hospitals_on_hospital_payment_and_tenant"
    t.index ["tenant_id"], name: "index_hospital_payment_hospitals_on_tenant_id"
  end

  create_table "hospital_payment_invoices", force: :cascade do |t|
    t.bigint "hospital_payment_id"
    t.bigint "sales_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.float "allocated_amount", default: 0.0
    t.integer "tenant_id", null: false
    t.index ["hospital_payment_id", "tenant_id"], name: "index_hospital_payment_invoices_on_hospital_payment_and_tenant"
    t.index ["sales_invoice_id", "tenant_id"], name: "index_hospital_payment_invoices_on_si_and_tenant"
    t.index ["tenant_id"], name: "index_hospital_payment_invoices_on_tenant_id"
  end

  create_table "hospital_payment_masters", force: :cascade do |t|
    t.bigint "hospital_payment_id"
    t.jsonb "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.jsonb "hospitals", default: {}
    t.integer "tenant_id", null: false
    t.index ["hospital_payment_id", "tenant_id"], name: "index_hospital_payment_masters_on_hospital_payment_and_tenant"
    t.index ["tenant_id"], name: "index_hospital_payment_masters_on_tenant_id"
  end

  create_table "hospital_payments", force: :cascade do |t|
    t.float "payment_amount"
    t.string "payment_mode"
    t.integer "transaction_type"
    t.string "status", default: "draft"
    t.string "reference_number"
    t.datetime "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.float "remaining_amount", default: 0.0
    t.bigint "group_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "bank"
    t.datetime "cheque_date"
    t.integer "tenant_id", null: false
    t.bigint "bank_id"
    t.index ["bank_id"], name: "index_hospital_payments_on_bank_id"
    t.index ["created_by_id"], name: "index_hospital_payments_on_created_by_id"
    t.index ["group_id", "tenant_id"], name: "index_hospital_payments_on_group_id_and_tenant_id"
    t.index ["last_updated_by_id"], name: "index_hospital_payments_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_hospital_payments_on_tenant_id"
  end

  create_table "hospital_purchase_history_items", force: :cascade do |t|
    t.datetime "date_of_purchase"
    t.string "item_name"
    t.string "brand"
    t.float "purchase_price"
    t.float "mrp"
    t.integer "quantity"
    t.integer "customer_id"
    t.string "generic_name"
    t.string "grn_number"
    t.integer "upload_id"
    t.float "margin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "master_sku_id"
    t.integer "hospital_id"
    t.boolean "save_for_later", default: false
    t.integer "purchase_upload_id"
    t.float "mrp_with_gst"
    t.float "total_mrp"
    t.float "mrp_per_unit"
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "discount_amount"
    t.float "discount_rate"
    t.jsonb "item_json"
    t.boolean "exact_match"
    t.string "category"
    t.string "sku_code"
    t.datetime "deleted_at"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_net_mrp"
    t.float "sgst_rate"
    t.float "sgst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.string "unit_of_measurement"
    t.float "purchase_price_per_unit"
    t.float "margin_amount"
    t.float "free_quantity"
    t.string "sub_category"
    t.integer "pack_size"
    t.string "status", default: "unmapped"
    t.integer "tenant_id", null: false
    t.index ["hospital_id", "tenant_id"], name: "index_hospital_purchase_history_items_on_hospital_and_tenant"
    t.index ["master_sku_id", "tenant_id"], name: "index_hospital_purchase_history_items_on_sku_and_tenant"
    t.index ["purchase_upload_id", "tenant_id"], name: "index_hospital_purchase_history_items_on_purchase_and_tenant"
    t.index ["tenant_id"], name: "index_hospital_purchase_history_items_on_tenant_id"
  end

  create_table "hospital_rate_contracts", force: :cascade do |t|
    t.string "rc_name"
    t.integer "total_items"
    t.integer "uniq_items"
    t.date "rc_start_date"
    t.date "rc_end_date"
    t.datetime "upload_date", default: -> { "CURRENT_DATE" }, null: false
    t.datetime "approve_date"
    t.datetime "reject_date"
    t.string "status", default: "pending", null: false
    t.string "reject_notes"
    t.bigint "group_id"
    t.integer "tenant_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_hospital_rate_contracts_on_created_by_id"
    t.index ["group_id"], name: "index_hospital_rate_contracts_on_group_id"
    t.index ["last_updated_by_id"], name: "index_hospital_rate_contracts_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_hospital_rate_contracts_on_tenant_id"
    t.index ["upload_date"], name: "index_hospital_rate_contracts_on_upload_date"
  end

  create_table "hospitals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.integer "akna_id"
    t.string "display_name"
    t.string "legal_name"
    t.string "group_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "pincode"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "gst_number"
    t.string "dl_number"
    t.string "agreement_type"
    t.datetime "portal_activated_at"
    t.datetime "deleted_at"
    t.datetime "last_verified_at"
    t.bigint "city_id"
    t.integer "hospital_purchase_history_uploads_count", default: 0
    t.integer "hospital_purchase_history_items_count", default: 0
    t.integer "parties_count", default: 0
    t.integer "rate_contracts_count", default: 0
    t.integer "rate_contract_uploads_count", default: 0
    t.integer "sales_orders_count", default: 0
    t.integer "sales_invoices_count", default: 0
    t.integer "default_branch_id"
    t.bigint "state_id"
    t.string "contact_person_name"
    t.string "email"
    t.bigint "group_id"
    t.string "classification"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "pan"
    t.integer "credit_period", default: 90
    t.string "fssai_number"
    t.boolean "include_3_month_expiry", default: true
    t.boolean "include_6_month_expiry", default: true
    t.boolean "exclude_multiple_mrp", default: true
    t.string "sales_contact_person"
    t.integer "tenant_id", null: false
    t.string "pan_number"
    t.boolean "ignore_tcs", default: true
    t.integer "hospital_entity_id"
    t.string "nl_number"
    t.date "fssai_expiry"
    t.date "dl_expiry"
    t.date "nl_expiry"
    t.boolean "apply_tcs", default: false
    t.boolean "optimise_for_single_batch", default: false
    t.boolean "internal_entity", default: false
    t.bigint "universal_hospital_id"
    t.boolean "is_sap_sync", default: false
    t.string "msme_number"
    t.date "msme_expiry"
    t.string "schedulex_number"
    t.date "schedulex_expiry"
    t.bigint "pincode_id"
    t.boolean "enabled_for_tenant", default: false
    t.string "billing_contact_person"
    t.bigint "universal_pincode_id"
    t.index ["city_id"], name: "index_hospitals_on_city_id"
    t.index ["created_by_id"], name: "index_hospitals_on_created_by_id"
    t.index ["default_branch_id", "tenant_id"], name: "index_hospitals_on_default_branch_id_and_tenant_id"
    t.index ["display_name", "group_name", "tenant_id"], name: "index_hospitals_on_display_name_and_group_name_and_tenant_id", unique: true, where: "(deleted_at IS NULL)"
    t.index ["group_id", "tenant_id"], name: "index_hospitals_on_group_id_and_tenant_id"
    t.index ["hospital_entity_id"], name: "index_hospitals_on_hospital_entity_id"
    t.index ["last_updated_by_id"], name: "index_hospitals_on_last_updated_by_id"
    t.index ["pincode_id"], name: "index_hospitals_on_pincode_id"
    t.index ["state_id"], name: "index_hospitals_on_state_id"
    t.index ["tenant_id"], name: "index_hospitals_on_tenant_id"
    t.index ["universal_hospital_id"], name: "index_hospitals_on_universal_hospital_id"
    t.index ["universal_pincode_id"], name: "index_hospitals_on_universal_pincode_id"
  end

  create_table "import_files", force: :cascade do |t|
    t.string "file_name"
    t.string "model_class"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["created_by_id"], name: "index_import_files_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_import_files_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_import_files_on_tenant_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "product_name"
    t.float "mrp", null: false
    t.float "purchase_rate", null: false
    t.float "sales_rate"
    t.float "sales_rate_b"
    t.float "sales_rate_c"
    t.float "gst_rate"
    t.float "cgst_rate"
    t.float "igst_rate"
    t.date "batch_expiry"
    t.string "batch_number"
    t.string "batch_details"
    t.integer "quantity", null: false
    t.text "remarks"
    t.bigint "branch_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.string "transaction_type", null: false
    t.string "item_source_type"
    t.bigint "item_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cost_price"
    t.date "received_date"
    t.string "company"
    t.string "unit_of_measurement"
    t.string "supplier"
    t.string "invoice_number"
    t.date "invoice_date"
    t.string "rack_number"
    t.boolean "is_quarantined", default: false
    t.string "notes"
    t.integer "tenant_id", null: false
    t.date "manufacturing_date"
    t.text "reason"
    t.datetime "conversion_time"
    t.integer "unit_pack_size"
    t.index ["branch_id", "tenant_id"], name: "index_inventories_on_branch_id_and_tenant_id"
    t.index ["created_by_id"], name: "index_inventories_on_created_by_id"
    t.index ["deleted_at"], name: "index_inventories_on_deleted_at"
    t.index ["item_source_type", "item_source_id", "transaction_type", "tenant_id"], name: "index_inventories_on_item_source_and_transaction_and_tenant", unique: true, where: "(deleted_at IS NULL)"
    t.index ["last_updated_by_id"], name: "index_inventories_on_last_updated_by_id"
    t.index ["master_sku_id", "batch_expiry", "branch_id"], name: "index_inventories_on_master_sku_and_expiry_and_branch"
    t.index ["master_sku_id", "tenant_id", "batch_expiry"], name: "index_inventories_on_master_sku_and_expiry_and_tenant"
    t.index ["master_sku_id", "tenant_id"], name: "index_inventories_on_master_sku_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_inventories_on_tenant_id"
  end

  create_table "invoice_formats", force: :cascade do |t|
    t.string "base_format"
    t.string "counter"
    t.string "year"
    t.string "counter_format"
    t.string "code"
    t.bigint "tenant_id"
    t.bigint "branch_id"
    t.bigint "order_type_id"
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year_applicable"
    t.index ["branch_id"], name: "index_invoice_formats_on_branch_id"
    t.index ["created_by_id"], name: "index_invoice_formats_on_created_by_id"
    t.index ["deleted_at"], name: "index_invoice_formats_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_invoice_formats_on_last_updated_by_id"
    t.index ["order_type_id"], name: "index_invoice_formats_on_order_type_id"
    t.index ["tenant_id"], name: "index_invoice_formats_on_tenant_id"
  end

  create_table "irn_audits", force: :cascade do |t|
    t.integer "audit_id"
    t.string "audit_type"
    t.string "status", default: "open", null: false
    t.jsonb "object_changes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audit_id", "audit_type"], name: "index_irn_audits_on_audit_id_and_audit_type"
  end

  create_table "master_categories", force: :cascade do |t|
    t.string "category_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.integer "master_skus_count", default: 0
    t.bigint "universal_category_id"
    t.index ["created_by_id"], name: "index_master_categories_on_created_by_id"
    t.index ["id", "deleted_at", "category_type"], name: "index_catrgories_on_deleted_and_type"
    t.index ["last_updated_by_id"], name: "index_master_categories_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_master_categories_on_tenant_id"
    t.index ["universal_category_id"], name: "index_master_categories_on_universal_category_id"
  end

  create_table "master_companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_name"
    t.datetime "deleted_at"
    t.integer "master_skus_count", default: 0
    t.bigint "city_id"
    t.bigint "created_by_id"
    t.bigint "deleted_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.string "display_name"
    t.bigint "universal_company_id"
    t.index ["city_id"], name: "index_master_companies_on_city_id"
    t.index ["created_by_id"], name: "index_master_companies_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_master_companies_on_deleted_by_id"
    t.index ["id", "tenant_id"], name: "index_companies_on_id_and_tenant"
    t.index ["last_updated_by_id"], name: "index_master_companies_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_master_companies_on_tenant_id"
    t.index ["universal_company_id"], name: "index_master_companies_on_universal_company_id"
  end

  create_table "master_company_divisions", force: :cascade do |t|
    t.bigint "master_company_id"
    t.string "name"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_partner_id"
    t.index ["company_partner_id"], name: "index_master_company_divisions_on_company_partner_id"
    t.index ["master_company_id"], name: "index_master_company_divisions_on_master_company_id"
    t.index ["tenant_id"], name: "index_master_company_divisions_on_tenant_id"
  end

  create_table "master_molecules", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "master_sku_molecules_count", default: 0
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.bigint "universal_molecule_id"
    t.index ["created_by_id"], name: "index_master_molecules_on_created_by_id"
    t.index ["deleted_at"], name: "index_master_molecules_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_master_molecules_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_master_molecules_on_tenant_id"
    t.index ["universal_molecule_id"], name: "index_master_molecules_on_universal_molecule_id"
  end

  create_table "master_patients", force: :cascade do |t|
    t.bigint "tenant_id"
    t.text "name", null: false
    t.text "email"
    t.text "address_line_1", null: false
    t.text "address_line_2"
    t.bigint "city_id", null: false
    t.bigint "state_id", null: false
    t.string "pincode"
    t.string "phone_number"
    t.text "doctor_name"
    t.text "doctor_hospital"
    t.date "diagnosis_date"
    t.integer "age"
    t.decimal "weight"
    t.string "sex"
    t.text "patient_hospital_id"
    t.text "remarks"
    t.string "id_proof_type"
    t.text "caretaker_name"
    t.string "caretaker_phone_number"
    t.string "caretaker_id_proof_type"
    t.boolean "narcotics_allowed", default: false
    t.boolean "schedule_h_allowed", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "deleted_by_id"
    t.integer "default_branch_id"
    t.string "alternative_ph_number"
    t.string "alternate_contact_number"
    t.boolean "is_sap_sync", default: false
    t.bigint "pincode_id"
    t.bigint "universal_pincode_id"
    t.index ["city_id"], name: "index_master_patients_on_city_id"
    t.index ["created_by_id"], name: "index_master_patients_on_created_by_id"
    t.index ["default_branch_id", "tenant_id"], name: "index_master_patients_on_default_branch_id_and_tenant_id"
    t.index ["deleted_by_id"], name: "index_master_patients_on_deleted_by_id"
    t.index ["pincode_id"], name: "index_master_patients_on_pincode_id"
    t.index ["state_id"], name: "index_master_patients_on_state_id"
    t.index ["tenant_id"], name: "index_master_patients_on_tenant_id"
    t.index ["universal_pincode_id"], name: "index_master_patients_on_universal_pincode_id"
    t.index ["updated_by_id"], name: "index_master_patients_on_updated_by_id"
  end

  create_table "master_sku_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["deleted_at"], name: "index_master_sku_categories_on_deleted_at"
    t.index ["tenant_id"], name: "index_master_sku_categories_on_tenant_id"
  end

  create_table "master_sku_molecules", force: :cascade do |t|
    t.bigint "master_molecule_id"
    t.bigint "master_sku_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "strength"
    t.string "unit"
    t.integer "tenant_id", null: false
    t.index ["deleted_at"], name: "index_master_sku_molecules_on_deleted_at"
    t.index ["master_molecule_id", "tenant_id"], name: "index_master_sku_molecules_on_master_molecule_id_and_tenant_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_master_sku_molecules_on_master_sku_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_master_sku_molecules_on_tenant_id"
  end

  create_table "master_sku_tags", force: :cascade do |t|
    t.bigint "master_sku_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["master_sku_id", "tenant_id"], name: "index_master_sku_tags_on_master_sku_id_and_tenant_id"
    t.index ["tag_id", "tenant_id"], name: "index_master_sku_tags_on_tag_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_master_sku_tags_on_tenant_id"
  end

  create_table "master_skus", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "brand_name"
    t.string "product_name"
    t.integer "modlecule_type"
    t.integer "sku_type"
    t.date "out_of_trade"
    t.string "pack_size"
    t.float "retail_price"
    t.integer "total_unit_quantity"
    t.string "molecule_ids_string"
    t.jsonb "master_sku_json"
    t.integer "old_sku_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "master_company_id"
    t.string "aknamed_sku_code"
    t.date "out_of_trade_date"
    t.string "unit"
    t.bigint "master_sku_category_id"
    t.datetime "deleted_at"
    t.boolean "is_verified", default: false
    t.boolean "enabled_for_transaction", default: false
    t.string "hsn_code"
    t.boolean "batch_number_optional", default: false
    t.boolean "batch_expiry_optional", default: false
    t.float "gst", default: 0.0
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "temperature"
    t.string "atc"
    t.string "atc_desc"
    t.string "nec"
    t.string "nec_desc"
    t.string "nfc"
    t.string "nfc_desc"
    t.string "latc"
    t.string "latc_desc"
    t.string "latc_super_grp"
    t.string "latc_acute_chronic_desc"
    t.string "latc_grp"
    t.string "latc_grp_desc"
    t.string "single_combinational"
    t.string "drug_schedule"
    t.string "pharma_otc"
    t.string "nlem_classification"
    t.string "pharma_form"
    t.string "pharma_strength"
    t.string "price_to_retailer"
    t.string "manufacturer_price"
    t.float "price_to_hospital"
    t.float "price_to_stockist"
    t.float "net_realizable_value"
    t.string "company_division", default: "Not Available"
    t.string "unit_of_measurement"
    t.integer "tenant_id", null: false
    t.boolean "dl_required", default: false
    t.boolean "fssai_required", default: false
    t.string "size"
    t.string "brand"
    t.string "variant"
    t.string "strength"
    t.string "pack_type"
    t.string "sub_category"
    t.string "schedule_category"
    t.string "manufacturer_code"
    t.boolean "gst_exempted", default: false
    t.float "mrp"
    t.integer "no_of_packs_in_a_box"
    t.bigint "master_category_id"
    t.integer "hospital_masters_count", default: 0
    t.boolean "nl_required", default: false
    t.bigint "current_mrp_branch_id"
    t.boolean "is_sap_sync", default: false
    t.text "sap_sync_branches", default: [], array: true
    t.integer "master_sku_molecules_count", default: 0, null: false
    t.bigint "original_manufacturer_id"
    t.bigint "universal_sku_id"
    t.string "product_type", default: "general_medicine"
    t.integer "unit_pack_size", default: 1
    t.index ["company_division"], name: "index_master_skus_on_company_division"
    t.index ["created_by_id"], name: "index_master_skus_on_created_by_id"
    t.index ["current_mrp_branch_id"], name: "index_master_skus_on_current_mrp_branch_id"
    t.index ["enabled_for_transaction", "tenant_id"], name: "index_master_skus_on_enabled_for_transaction_and_tenant_id"
    t.index ["id", "master_company_id", "tenant_id"], name: "index_skus_on_id_and_company_and_tenant"
    t.index ["id", "molecule_ids_string"], name: "index_skus_on_id_and_molecule"
    t.index ["id", "tenant_id", "description"], name: "index_master_skus_on_id_and_tenant_and_desc"
    t.index ["id", "tenant_id"], name: "index_master_skus_on_id_and_tenant"
    t.index ["last_updated_by_id"], name: "index_master_skus_on_last_updated_by_id"
    t.index ["master_category_id"], name: "index_master_skus_on_master_category_id"
    t.index ["master_company_id", "tenant_id"], name: "index_master_skus_on_master_company_id_and_tenant_id"
    t.index ["master_sku_category_id", "tenant_id"], name: "index_master_skus_on_master_sku_category_id_and_tenant_id"
    t.index ["original_manufacturer_id"], name: "index_master_skus_on_original_manufacturer_id"
    t.index ["tenant_id"], name: "index_master_skus_on_tenant_id"
    t.index ["universal_sku_id", "tenant_id"], name: "index_master_skus_on_universal_sku_id_and_tenant"
    t.index ["universal_sku_id"], name: "index_master_skus_on_universal_sku_id"
  end

  create_table "master_skus_bulk_sku_uploads", force: :cascade do |t|
    t.bigint "master_sku_id"
    t.bigint "bulk_sku_upload_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["bulk_sku_upload_id", "tenant_id"], name: "index_master_skus_bulk_sku_uploads_on_sku_upload_and_tenant"
    t.index ["master_sku_id", "tenant_id"], name: "index_master_skus_bulk_sku_uploads_on_sku_and_tenant"
    t.index ["tenant_id"], name: "index_master_skus_bulk_sku_uploads_on_tenant_id"
  end

  create_table "master_tag_categories", force: :cascade do |t|
    t.bigint "master_category_id"
    t.bigint "tag_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["master_category_id", "tag_category_id"], name: "index_tag_categories_on_category_and_tag"
    t.index ["master_category_id", "tenant_id"], name: "index_master_tag_categories_on_master_category_id_and_tenant_id"
    t.index ["tag_category_id", "tenant_id"], name: "index_master_tag_categories_on_tag_category_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_master_tag_categories_on_tenant_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_fulfillments", force: :cascade do |t|
    t.bigint "sales_order_id"
    t.boolean "is_delivered_on_time", default: false
    t.datetime "fulfillment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["sales_order_id", "tenant_id"], name: "index_order_fulfillments_on_sales_order_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_order_fulfillments_on_tenant_id"
  end

  create_table "order_types", force: :cascade do |t|
    t.string "name"
    t.bigint "tenant_id"
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_order_types_on_created_by_id"
    t.index ["deleted_at"], name: "index_order_types_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_order_types_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_order_types_on_tenant_id"
  end

  create_table "original_manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "group_name"
    t.datetime "deleted_at"
    t.integer "tenant_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_original_manufacturers_on_created_by_id"
    t.index ["deleted_at"], name: "index_original_manufacturers_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_original_manufacturers_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_original_manufacturers_on_tenant_id"
  end

  create_table "patient_payment_invoices", force: :cascade do |t|
    t.bigint "patient_payment_id"
    t.bigint "sales_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "tenant_id"
    t.float "allocated_amount", default: 0.0
    t.index ["patient_payment_id"], name: "index_patient_payment_invoices_on_patient_payment_id"
    t.index ["sales_invoice_id"], name: "index_patient_payment_invoices_on_sales_invoice_id"
    t.index ["tenant_id"], name: "index_patient_payment_invoices_on_tenant_id"
  end

  create_table "patient_payments", force: :cascade do |t|
    t.float "payment_amount"
    t.string "payment_mode"
    t.string "status", default: "draft"
    t.string "reference_number"
    t.datetime "payment_date"
    t.string "bank"
    t.datetime "cheque_date"
    t.string "payer_type"
    t.bigint "tenant_id"
    t.bigint "payer_id"
    t.bigint "bank_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.float "remaining_amount", default: 0.0
    t.index ["bank_id"], name: "index_patient_payments_on_bank_id"
    t.index ["created_by_id"], name: "index_patient_payments_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_patient_payments_on_last_updated_by_id"
    t.index ["payer_id"], name: "index_patient_payments_on_payer_id"
    t.index ["tenant_id"], name: "index_patient_payments_on_tenant_id"
  end

  create_table "payers", force: :cascade do |t|
    t.string "display_name", null: false
    t.string "payer_type", null: false
    t.integer "credit_period"
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deleted_by_id"
    t.index ["created_by_id"], name: "index_payers_on_created_by_id"
    t.index ["deleted_at"], name: "index_payers_on_deleted_at"
    t.index ["deleted_by_id"], name: "index_payers_on_deleted_by_id"
    t.index ["last_updated_by_id"], name: "index_payers_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_payers_on_tenant_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "subject_class"
    t.string "action"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["tenant_id"], name: "index_permissions_on_tenant_id"
  end

  create_table "pick_list_items", force: :cascade do |t|
    t.bigint "pick_list_id"
    t.bigint "sales_order_item_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "batch_number", null: false
    t.datetime "batch_expiry"
    t.integer "quantity", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "mrp"
    t.integer "tenant_id", null: false
    t.date "manufacturing_date"
    t.index ["created_by_id"], name: "index_pick_list_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_pick_list_items_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_pick_list_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_pick_list_items_on_master_sku_id_and_tenant_id"
    t.index ["pick_list_id", "tenant_id"], name: "index_pick_list_items_on_pick_list_id_and_tenant_id"
    t.index ["sales_order_item_id"], name: "index_pick_list_items_on_sales_order_item_id"
    t.index ["tenant_id"], name: "index_pick_list_items_on_tenant_id"
  end

  create_table "pick_lists", force: :cascade do |t|
    t.bigint "sales_order_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "pl_number"
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.datetime "invoiced_at"
    t.boolean "extend_expiry", default: false
    t.index ["created_by_id"], name: "index_pick_lists_on_created_by_id"
    t.index ["deleted_at"], name: "index_pick_lists_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_pick_lists_on_last_updated_by_id"
    t.index ["sales_order_id", "tenant_id"], name: "index_pick_lists_on_sales_order_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_pick_lists_on_tenant_id"
  end

  create_table "pincodes", force: :cascade do |t|
    t.string "number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "universal_state_id"
    t.bigint "universal_city_id"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "deleted_by_id"
    t.index ["created_by_id"], name: "index_pincodes_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_pincodes_on_deleted_by_id"
    t.index ["universal_city_id"], name: "index_pincodes_on_universal_city_id"
    t.index ["universal_state_id"], name: "index_pincodes_on_universal_state_id"
    t.index ["updated_by_id"], name: "index_pincodes_on_updated_by_id"
  end

  create_table "printouts", force: :cascade do |t|
    t.string "printable_type"
    t.bigint "printable_id"
    t.string "print_status"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["created_by_id"], name: "index_printouts_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_printouts_on_last_updated_by_id"
    t.index ["printable_type", "printable_id"], name: "index_printouts_on_printable_type_and_printable_id"
    t.index ["tenant_id"], name: "index_printouts_on_tenant_id"
  end

  create_table "purchase_invoice_items", force: :cascade do |t|
    t.bigint "purchase_invoice_id"
    t.bigint "purchase_order_item_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "product_name"
    t.string "batch_number"
    t.date "batch_expiry"
    t.integer "quantity", null: false
    t.float "rate", null: false
    t.float "mrp", null: false
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "discount_rate"
    t.integer "free_quantity"
    t.float "discount_amount"
    t.integer "tenant_id", null: false
    t.integer "ordered_quantity"
    t.integer "ordered_free_quantity"
    t.float "ordered_mrp"
    t.float "ordered_rate"
    t.float "ordered_discount_rate"
    t.float "ordered_discount_amount"
    t.string "ordered_uom"
    t.integer "ordered_pending_quantity", default: 0
    t.integer "quantity_per_unit"
    t.integer "min_quantity_per_unit"
    t.string "supplier_uom"
    t.float "ptr", default: 0.0
    t.float "pts", default: 0.0
    t.float "scheme_discount_rate", default: 0.0
    t.float "scheme_discount_amount", default: 0.0
    t.float "cash_discount_rate", default: 0.0
    t.float "cash_discount_amount", default: 0.0
    t.float "margin_rate", default: 0.0
    t.date "manufacturing_date"
    t.float "cumulative_discount_amount", default: 0.0
    t.string "hsn_code"
    t.index ["created_by_id"], name: "index_purchase_invoice_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_purchase_invoice_items_on_deleted_at"
    t.index ["id", "purchase_invoice_id", "master_sku_id", "tenant_id"], name: "index_pii_pi_sku_tenant"
    t.index ["id", "tenant_id"], name: "index_pi_items_on_id_and_tenant"
    t.index ["last_updated_by_id"], name: "index_purchase_invoice_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_purchase_invoice_items_on_master_sku_id_and_tenant_id"
    t.index ["purchase_invoice_id", "tenant_id"], name: "index_purchase_invoice_items_on_pi_and_tenant"
    t.index ["purchase_order_item_id"], name: "index_purchase_invoice_items_on_purchase_order_item_id"
    t.index ["tenant_id"], name: "index_purchase_invoice_items_on_tenant_id"
  end

  create_table "purchase_invoices", force: :cascade do |t|
    t.string "supplier_party_type"
    t.bigint "supplier_party_id"
    t.bigint "branch_id"
    t.bigint "purchase_order_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "so_number"
    t.date "receive_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logistic_paid_by"
    t.float "logistic_cost", default: 0.0
    t.float "remaining_amount", default: 0.0
    t.string "payment_invoice_status", default: "pending"
    t.string "grn_number"
    t.date "pi_date"
    t.float "tcs_percentage"
    t.float "tcs_amount"
    t.float "pre_tcs_amount"
    t.integer "tenant_id", null: false
    t.integer "aknamed_total_quantity", default: 0
    t.float "pi_total_value"
    t.integer "pi_item_count"
    t.datetime "pi_receiving_date"
    t.integer "round_off_amount", default: 0
    t.integer "sap_pi_id"
    t.string "sap_uuid"
    t.date "payment_due_date"
    t.integer "sap_supplier_invoice_id"
    t.datetime "confirmed_at"
    t.datetime "cancelled_at"
    t.index ["branch_id"], name: "index_purchase_invoices_on_branch_id"
    t.index ["created_by_id"], name: "index_purchase_invoices_on_created_by_id"
    t.index ["deleted_at"], name: "index_purchase_invoices_on_deleted_at"
    t.index ["id", "branch_id", "supplier_party_id", "tenant_id"], name: "index_pi_branch_supplier_tenant"
    t.index ["id", "tenant_id"], name: "index_pi_on_id_and_tenant"
    t.index ["last_updated_by_id"], name: "index_purchase_invoices_on_last_updated_by_id"
    t.index ["purchase_order_id", "status", "receive_date", "tenant_id"], name: "index_pi_on_po_and_status_and_date_and_tenant"
    t.index ["purchase_order_id", "tenant_id"], name: "index_purchase_invoices_on_purchase_order_id_and_tenant_id"
    t.index ["receive_date"], name: "index_purchase_invoices_on_receive_date"
    t.index ["supplier_party_type", "supplier_party_id", "tenant_id"], name: "index_purchase_invoices_on_supplier_and_tenant"
    t.index ["tenant_id", "id", "purchase_order_id", "created_by_id", "created_at", "receive_date", "branch_id"], name: "index_pi_and_details"
    t.index ["tenant_id"], name: "index_purchase_invoices_on_tenant_id"
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.bigint "purchase_order_id"
    t.bigint "master_sku_id"
    t.bigint "rate_contract_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "quantity", null: false
    t.float "tolerance"
    t.float "rate", null: false
    t.float "mrp"
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit_of_measurement"
    t.float "discount_rate"
    t.integer "free_quantity"
    t.float "discount_amount"
    t.integer "pending_quantity", default: 0
    t.boolean "pending_qty_to_be_invoiced", default: true
    t.integer "tenant_id", null: false
    t.integer "pending_free_quantity", default: 0
    t.index ["created_by_id"], name: "index_purchase_order_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_purchase_order_items_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_purchase_order_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_purchase_order_items_on_master_sku_id_and_tenant_id"
    t.index ["purchase_order_id", "master_sku_id", "pending_qty_to_be_invoiced", "tenant_id"], name: "index_poi_on_po_and_msid_and_pend_bool_and_tenant"
    t.index ["purchase_order_id", "master_sku_id", "tenant_id"], name: "index_poi_on_po_and_msid_and_tenant"
    t.index ["purchase_order_id", "tenant_id"], name: "index_purchase_order_items_on_purchase_order_id_and_tenant_id"
    t.index ["rate_contract_id"], name: "index_purchase_order_items_on_rate_contract_id"
    t.index ["tenant_id"], name: "index_purchase_order_items_on_tenant_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "supplier_party_type"
    t.bigint "supplier_party_id"
    t.bigint "branch_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "po_number"
    t.date "order_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_term"
    t.date "expected_delivery_date"
    t.string "logistic_paid_by"
    t.float "tcs_percentage"
    t.float "tcs_amount"
    t.float "pre_tcs_amount"
    t.integer "tenant_id", null: false
    t.float "logistic_cost", default: 0.0
    t.boolean "advance_with_tcs", default: false
    t.integer "sap_po_id"
    t.datetime "last_follow_up_date"
    t.integer "last_follow_up_by"
    t.string "remarks"
    t.integer "credit_days"
    t.datetime "placed_at"
    t.datetime "short_closed_at"
    t.datetime "completed_at"
    t.datetime "cancelled_at"
    t.index ["branch_id", "tenant_id"], name: "index_purchase_orders_on_branch_id_and_tenant_id"
    t.index ["created_by_id"], name: "index_purchase_orders_on_created_by_id"
    t.index ["deleted_at"], name: "index_purchase_orders_on_deleted_at"
    t.index ["id", "tenant_id", "status", "order_date"], name: "index_po_on_id_and_status_and_date_and_tenant"
    t.index ["last_updated_by_id"], name: "index_purchase_orders_on_last_updated_by_id"
    t.index ["order_date"], name: "index_purchase_orders_on_order_date"
    t.index ["supplier_party_type", "supplier_party_id", "tenant_id"], name: "index_purchase_orders_on_supplier_and_tenant"
    t.index ["tenant_id", "branch_id", "order_date", "created_at", "deleted_at", "created_by_id"], name: "index_po_and_details"
    t.index ["tenant_id"], name: "index_purchase_orders_on_tenant_id"
  end

  create_table "purchase_rate_contracts", force: :cascade do |t|
    t.bigint "master_sku_id"
    t.string "source_party_type"
    t.integer "source_party_id"
    t.string "rc_number"
    t.date "start_date"
    t.date "end_date"
    t.string "unit_of_measurement"
    t.bigint "purchase_rc_upload_id"
    t.integer "rate_type"
    t.float "static_rate"
    t.float "dynamic_rate"
    t.float "disc_percentage", default: 0.0
    t.integer "scheme_qty"
    t.integer "scheme_free_qty"
    t.date "scheme_start_date"
    t.date "scheme_end_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.index ["created_by_id"], name: "index_purchase_rate_contracts_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_purchase_rate_contracts_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_purchase_rate_contracts_on_master_sku_id_and_tenant_id"
    t.index ["purchase_rc_upload_id", "tenant_id"], name: "index_purchase_rate_contracts_on_rc_upload_and_tenant"
    t.index ["tenant_id"], name: "index_purchase_rate_contracts_on_tenant_id"
  end

  create_table "purchase_rc_uploads", force: :cascade do |t|
    t.integer "purchase_rate_contracts_count", default: 0
    t.string "source_party_type"
    t.text "source_party_ids", default: [], array: true
    t.jsonb "stats", default: {}
    t.jsonb "upload_errors", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["tenant_id"], name: "index_purchase_rc_uploads_on_tenant_id"
  end

  create_table "purchase_return_items", force: :cascade do |t|
    t.bigint "purchase_return_id"
    t.bigint "master_sku_id"
    t.bigint "purchase_invoice_item_id"
    t.integer "quantity"
    t.float "rate"
    t.float "mrp"
    t.float "gst_rate"
    t.float "cgst_rate"
    t.float "igst_rate"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.string "batch_number"
    t.datetime "batch_expiry"
    t.float "total_discount"
    t.string "product_name"
    t.string "notes"
    t.integer "free_quantity"
    t.integer "branch_id"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "gst_amount"
    t.float "cgst_amount"
    t.float "igst_amount"
    t.float "discount_rate"
    t.float "discount_amount"
    t.string "status"
    t.integer "tenant_id", null: false
    t.date "manufacturing_date"
    t.string "type_of_return"
    t.integer "min_quantity_per_unit"
    t.integer "quantity_per_unit"
    t.string "supplier_uom"
    t.integer "supplier_quantity"
    t.integer "supplier_free_quantity"
    t.float "supplier_mrp"
    t.float "supplier_rate"
    t.index ["created_by_id"], name: "index_purchase_return_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_purchase_return_items_on_deleted_at"
    t.index ["master_sku_id", "tenant_id"], name: "index_purchase_return_items_on_master_sku_id_and_tenant_id"
    t.index ["purchase_invoice_item_id", "tenant_id"], name: "index_purchase_return_items_on_pii_and_tenant"
    t.index ["purchase_return_id", "tenant_id"], name: "index_purchase_return_items_on_pr_and_tenant"
    t.index ["tenant_id"], name: "index_purchase_return_items_on_tenant_id"
  end

  create_table "purchase_returns", force: :cascade do |t|
    t.bigint "purchase_invoice_id"
    t.bigint "branch_id"
    t.string "status", default: "draft", null: false
    t.float "total_quantity"
    t.float "total_value"
    t.float "net_value"
    t.float "tax_value"
    t.string "return_type"
    t.string "reference_number"
    t.datetime "return_date"
    t.integer "purchase_return_items_count", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "invoice_number"
    t.float "total_discount_amount"
    t.string "logistic_paid_by"
    t.float "logistic_cost", default: 0.0
    t.date "pr_date"
    t.integer "tenant_id", null: false
    t.boolean "pr_with_out_gst", default: false
    t.index ["branch_id", "tenant_id"], name: "index_purchase_returns_on_branch_id_and_tenant_id"
    t.index ["created_by_id"], name: "index_purchase_returns_on_created_by_id"
    t.index ["deleted_at"], name: "index_purchase_returns_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_purchase_returns_on_last_updated_by_id"
    t.index ["purchase_invoice_id", "tenant_id"], name: "index_purchase_returns_on_purchase_invoice_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_purchase_returns_on_tenant_id"
  end

  create_table "quarantines", force: :cascade do |t|
    t.bigint "master_sku_id"
    t.bigint "branch_id"
    t.string "product_name"
    t.string "notes"
    t.string "batch_number"
    t.date "batch_expiry"
    t.integer "quantity", null: false
    t.integer "free_quantity"
    t.float "rate"
    t.float "mrp"
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.date "manufacturing_date"
    t.index ["branch_id", "tenant_id"], name: "index_quarantines_on_branch_id_and_tenant_id"
    t.index ["created_by_id"], name: "index_quarantines_on_created_by_id"
    t.index ["deleted_at"], name: "index_quarantines_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_quarantines_on_last_updated_by_id"
    t.index ["master_sku_id", "branch_id", "tenant_id"], name: "index_quarantines_on_sku_and_branch_and_tenant"
    t.index ["master_sku_id", "tenant_id"], name: "index_quarantines_on_master_sku_id_and_tenant_id"
    t.index ["notes", "tenant_id"], name: "index_notes_tenant"
    t.index ["tenant_id"], name: "index_quarantines_on_tenant_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["tenant_id"], name: "index_regions_on_tenant_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["name", "resource_type", "resource_id", "tenant_id"], name: "inx_resource_type_id_tenant_id"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "inx_resource_type_id"
    t.index ["tenant_id"], name: "index_roles_on_tenant_id"
  end

  create_table "sales_invoice_items", force: :cascade do |t|
    t.bigint "sales_invoice_id"
    t.bigint "sales_order_item_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "product_name"
    t.string "notes"
    t.string "batch_number"
    t.date "batch_expiry"
    t.integer "quantity", null: false
    t.float "rate", null: false
    t.float "mrp", null: false
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "discount_rate"
    t.integer "free_quantity"
    t.integer "replaced_sku_id"
    t.float "discount_amount"
    t.float "cumulative_discount_amount", default: 0.0
    t.float "cumulative_discount_percentage", default: 0.0
    t.bigint "pick_list_item_id"
    t.integer "tenant_id", null: false
    t.float "margin"
    t.float "margin_perc"
    t.date "manufacturing_date"
    t.string "uom"
    t.integer "delivery_challan_item_id"
    t.float "pre_cumulative_disc_amount", default: 0.0
    t.string "product_type"
    t.float "gross_margin", default: 0.0
    t.float "epr", default: 0.0
    t.jsonb "item_source_ids", default: {}
    t.index ["created_by_id"], name: "index_sales_invoice_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_sales_invoice_items_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_sales_invoice_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_sales_invoice_items_on_master_sku_id_and_tenant_id"
    t.index ["pick_list_item_id", "tenant_id"], name: "index_sales_invoice_items_on_pick_list_item_id_and_tenant_id"
    t.index ["replaced_sku_id", "tenant_id"], name: "index_sales_invoice_items_on_replaced_sku_id_and_tenant_id"
    t.index ["sales_invoice_id", "sales_order_item_id", "tenant_id"], name: "index_sii_on_soi_and_siid_and_tenant"
    t.index ["sales_invoice_id", "tenant_id"], name: "index_sales_invoice_items_on_sales_invoice_id_and_tenant_id"
    t.index ["sales_order_item_id", "tenant_id"], name: "index_sales_invoice_items_on_sales_order_item_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_sales_invoice_items_on_tenant_id"
  end

  create_table "sales_invoice_uploads", force: :cascade do |t|
    t.string "file_name"
    t.string "status", default: "draft", null: false
    t.jsonb "upload_errors", default: {}
    t.integer "tenant_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_sales_invoice_uploads_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_sales_invoice_uploads_on_last_updated_by_id"
  end

  create_table "sales_invoices", force: :cascade do |t|
    t.string "buyer_party_type"
    t.bigint "buyer_party_id"
    t.bigint "branch_id"
    t.bigint "sales_order_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "invoice_number"
    t.date "invoice_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cumulative_percentage", default: 0.0
    t.boolean "mask_line_item_discount", default: false
    t.string "credit_note_number"
    t.boolean "grn_verified", default: false
    t.string "logistic_paid_by"
    t.float "logistic_cost", default: 0.0
    t.float "remaining_amount", default: 0.0
    t.string "payment_invoice_status", default: "pending"
    t.boolean "shipping_address_same_as_billing_address", default: true
    t.bigint "shipping_address_id"
    t.boolean "status_si_confirm_mailer", default: false
    t.boolean "status_si_dispatch_mailer", default: false
    t.boolean "status_si_deliver_mailer", default: false
    t.float "tcs_percentage"
    t.float "tcs_amount"
    t.float "pre_tcs_amount"
    t.string "return_status"
    t.integer "tenant_id", null: false
    t.date "payment_due_date"
    t.datetime "confirmed_at"
    t.boolean "confirmed_status", default: false
    t.bigint "pick_list_id"
    t.string "irn_no"
    t.jsonb "irn_response", default: {}
    t.string "eway_bill_no"
    t.jsonb "eway_bill_response", default: {}
    t.bigint "confirmed_by_id"
    t.jsonb "cancelation_response"
    t.float "cumulative_disc_amount", default: 0.0
    t.string "sap_uuid"
    t.string "sap_tracking_number"
    t.bigint "delivery_challan_id"
    t.boolean "billed_at_mrp"
    t.datetime "dispatched_at"
    t.datetime "delivered_at"
    t.datetime "pod_uploaded_at"
    t.integer "pod_count"
    t.jsonb "medigate_order_accept_response"
    t.jsonb "medigate_dispatch_response"
    t.jsonb "medigate_deliver_response"
    t.string "medigate_invoice_number"
    t.datetime "medigate_delivery_time"
    t.index ["branch_id", "tenant_id"], name: "index_sales_invoices_on_branch_id_and_tenant_id"
    t.index ["buyer_party_type", "buyer_party_id", "tenant_id"], name: "index_sales_invoices_on_buyer_and_tenant"
    t.index ["confirmed_by_id"], name: "index_sales_invoices_on_confirmed_by_id"
    t.index ["created_by_id"], name: "index_sales_invoices_on_created_by_id"
    t.index ["deleted_at"], name: "index_sales_invoices_on_deleted_at"
    t.index ["delivery_challan_id"], name: "index_sales_invoices_on_delivery_challan_id"
    t.index ["invoice_date"], name: "index_sales_invoices_on_invoice_date"
    t.index ["last_updated_by_id"], name: "index_sales_invoices_on_last_updated_by_id"
    t.index ["pick_list_id"], name: "index_sales_invoices_on_pick_list_id"
    t.index ["sales_order_id", "tenant_id"], name: "index_sales_invoices_on_sales_order_id_and_tenant_id"
    t.index ["shipping_address_id"], name: "index_sales_invoices_on_shipping_address_id"
    t.index ["tenant_id", "branch_id", "buyer_party_type", "invoice_date", "created_at"], name: "index_si_and_details"
    t.index ["tenant_id"], name: "index_sales_invoices_on_tenant_id"
  end

  create_table "sales_order_items", force: :cascade do |t|
    t.bigint "sales_order_id"
    t.bigint "master_sku_id"
    t.bigint "rate_contract_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "product_name"
    t.integer "quantity", null: false
    t.float "tolerance"
    t.float "rate", null: false
    t.float "mrp"
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit_of_measurement"
    t.float "discount_rate"
    t.integer "free_quantity"
    t.float "discount_amount"
    t.float "cumulative_discount_amount", default: 0.0
    t.float "cumulative_discount_percentage", default: 0.0
    t.bigint "delivery_challan_item_id"
    t.boolean "pending_qty_to_be_invoiced", default: true
    t.integer "pending_quantity", default: 0
    t.string "remarks"
    t.integer "pending_free_quantity"
    t.integer "tenant_id", null: false
    t.integer "ordered_quantity"
    t.integer "ordered_free_quantity"
    t.float "ordered_mrp"
    t.float "ordered_rate"
    t.float "ordered_discount_rate"
    t.float "ordered_discount_amount"
    t.string "ordered_uom"
    t.integer "ordered_pending_quantity", default: 0
    t.integer "quantity_per_unit"
    t.integer "min_quantity_per_unit"
    t.float "po_quantity"
    t.float "po_free_quantity"
    t.float "po_total_amount"
    t.index ["created_by_id"], name: "index_sales_order_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_sales_order_items_on_deleted_at"
    t.index ["delivery_challan_item_id", "tenant_id"], name: "index_sales_order_items_on_dc_and_tenant"
    t.index ["id", "master_sku_id", "sales_order_id", "tenant_id"], name: "index_soi_on_msid_and_soi_and_tenant"
    t.index ["last_updated_by_id"], name: "index_sales_order_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_sales_order_items_on_master_sku_id_and_tenant_id"
    t.index ["rate_contract_id"], name: "index_sales_order_items_on_rate_contract_id"
    t.index ["sales_order_id", "master_sku_id", "pending_qty_to_be_invoiced", "tenant_id"], name: "index_soi_on_so_and_msid_and_pend_bool_and_tenant"
    t.index ["sales_order_id", "tenant_id"], name: "index_sales_order_items_on_sales_order_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_sales_order_items_on_tenant_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.string "buyer_party_type"
    t.bigint "buyer_party_id"
    t.bigint "branch_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "po_number"
    t.string "so_number"
    t.date "order_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "status", default: "draft", null: false
    t.datetime "deleted_at"
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "delivery_challan_id"
    t.string "logistic_paid_by"
    t.date "so_date"
    t.boolean "status_so_placed_mailer", default: false
    t.text "expected_delivery_date", default: [], array: true
    t.integer "tenant_id", null: false
    t.integer "aknamed_total_quantity", default: 0
    t.float "po_total_amount"
    t.string "priority_tag"
    t.string "prescription_number"
    t.datetime "prescription_date"
    t.integer "payer_party_id"
    t.string "payer_party_type"
    t.string "payment_mode"
    t.string "reference_person"
    t.bigint "order_type_id"
    t.datetime "confirmed_at"
    t.integer "sap_so_id"
    t.string "uhid"
    t.string "patient_name"
    t.string "department_name"
    t.string "payment_term", default: "credit_days"
    t.string "reference_number"
    t.datetime "placed_at"
    t.datetime "cancelled_at"
    t.datetime "short_closed_at"
    t.datetime "completed_at"
    t.boolean "is_medigate_order", default: false
    t.index ["branch_id", "tenant_id"], name: "index_sales_orders_on_branch_id_and_tenant_id"
    t.index ["buyer_party_id", "status", "order_date"], name: "index_orders_on_buyer_and_status_and_date"
    t.index ["buyer_party_type", "buyer_party_id", "tenant_id"], name: "index_sales_orders_on_buyer_and_tenant"
    t.index ["created_by_id"], name: "index_sales_orders_on_created_by_id"
    t.index ["deleted_at"], name: "index_sales_orders_on_deleted_at"
    t.index ["delivery_challan_id", "tenant_id"], name: "index_sales_orders_on_delivery_challan_id_and_tenant_id"
    t.index ["id", "branch_id", "status", "tenant_id"], name: "index_so_on_id_and_status_and_branch_and_tenant"
    t.index ["id", "buyer_party_id", "order_date", "status", "tenant_id"], name: "index_so_on_id_and_status_and_date_and_buyer_and_tenant"
    t.index ["last_updated_by_id"], name: "index_sales_orders_on_last_updated_by_id"
    t.index ["order_date"], name: "index_sales_orders_on_order_date"
    t.index ["order_type_id"], name: "index_sales_orders_on_order_type_id"
    t.index ["payer_party_id", "payer_party_type", "tenant_id"], name: "index_sales_orders_on_payer_and_tenant"
    t.index ["tenant_id"], name: "index_sales_orders_on_tenant_id"
  end

  create_table "sales_rate_contracts", force: :cascade do |t|
    t.bigint "master_sku_id"
    t.string "source_party_type"
    t.integer "source_party_id"
    t.string "rc_number"
    t.date "start_date"
    t.date "end_date"
    t.string "unit_of_measurement"
    t.bigint "sales_rc_upload_id"
    t.integer "rate_type"
    t.float "static_rate"
    t.float "dynamic_rate"
    t.float "disc_percentage", default: 0.0
    t.integer "scheme_qty"
    t.integer "scheme_free_qty"
    t.date "scheme_start_date"
    t.date "scheme_end_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.string "category_type"
    t.integer "tenant_id", null: false
    t.boolean "enforce_this_rc", default: false
    t.boolean "pre_tax", default: false
    t.index ["created_by_id"], name: "index_sales_rate_contracts_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_sales_rate_contracts_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id", "source_party_type", "source_party_id"], name: "index_salesrc_on_sku_and_source_and_tenant"
    t.index ["master_sku_id", "tenant_id"], name: "index_sales_rate_contracts_on_master_sku_id_and_tenant_id"
    t.index ["sales_rc_upload_id", "tenant_id"], name: "index_sales_rate_contracts_on_sales_rc_upload_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_sales_rate_contracts_on_tenant_id"
  end

  create_table "sales_rc_uploads", force: :cascade do |t|
    t.integer "sales_rate_contracts_count", default: 0
    t.string "source_party_type"
    t.text "source_party_ids", default: [], array: true
    t.jsonb "stats", default: {}
    t.jsonb "upload_errors", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_type"
    t.integer "tenant_id", null: false
    t.datetime "deleted_at"
    t.index ["tenant_id"], name: "index_sales_rc_uploads_on_tenant_id"
  end

  create_table "sales_return_items", force: :cascade do |t|
    t.bigint "sales_return_id"
    t.bigint "sales_invoice_item_id"
    t.bigint "master_sku_id"
    t.integer "quantity", null: false
    t.integer "free_quantity"
    t.float "rate", null: false
    t.float "discount_rate"
    t.string "notes"
    t.string "batch_number"
    t.date "batch_expiry"
    t.float "mrp", null: false
    t.float "gst_rate"
    t.float "gst_amount"
    t.float "cgst_rate"
    t.float "cgst_amount"
    t.float "igst_rate"
    t.float "igst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "total_tax_amount"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "discount_amount"
    t.integer "tenant_id", null: false
    t.string "action"
    t.date "manufacturing_date"
    t.string "uom"
    t.float "cumulative_disc_amount", default: 0.0
    t.index ["created_by_id"], name: "index_sales_return_items_on_created_by_id"
    t.index ["deleted_at"], name: "index_sales_return_items_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_sales_return_items_on_last_updated_by_id"
    t.index ["master_sku_id", "tenant_id"], name: "index_sales_return_items_on_master_sku_id_and_tenant_id"
    t.index ["sales_invoice_item_id", "tenant_id"], name: "index_sales_return_items_on_sales_invoice_item_id_and_tenant_id"
    t.index ["sales_return_id", "tenant_id"], name: "index_sales_return_items_on_sales_return_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_sales_return_items_on_tenant_id"
  end

  create_table "sales_returns", force: :cascade do |t|
    t.string "return_number"
    t.bigint "sales_invoice_id"
    t.bigint "branch_id"
    t.string "status", default: "draft", null: false
    t.date "return_date", default: -> { "CURRENT_DATE" }, null: false
    t.integer "items_count", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.float "total_amount", default: 0.0, null: false
    t.float "total_net_amount", default: 0.0, null: false
    t.float "total_tax_amount", default: 0.0, null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "return_invoice_number"
    t.string "logistic_paid_by"
    t.float "logistic_cost", default: 0.0
    t.date "sr_date"
    t.integer "tenant_id", null: false
    t.float "tcs_percentage"
    t.float "tcs_amount"
    t.float "pre_tcs_amount"
    t.boolean "create_credit_note", default: false
    t.string "sap_tracking_number"
    t.string "sap_uuid"
    t.index ["branch_id", "tenant_id"], name: "index_sales_returns_on_branch_id_and_tenant_id"
    t.index ["created_by_id"], name: "index_sales_returns_on_created_by_id"
    t.index ["deleted_at"], name: "index_sales_returns_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_sales_returns_on_last_updated_by_id"
    t.index ["return_date"], name: "index_sales_returns_on_return_date"
    t.index ["sales_invoice_id", "tenant_id"], name: "index_sales_returns_on_sales_invoice_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_sales_returns_on_tenant_id"
  end

  create_table "searchjoy_searches", force: :cascade do |t|
    t.bigint "user_id"
    t.string "search_type"
    t.string "query"
    t.string "normalized_query"
    t.integer "results_count"
    t.datetime "created_at"
    t.string "convertable_type"
    t.bigint "convertable_id"
    t.datetime "converted_at"
    t.index ["convertable_type", "convertable_id"], name: "index_searchjoy_searches_on_convertable"
    t.index ["created_at"], name: "index_searchjoy_searches_on_created_at"
    t.index ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at"
    t.index ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_query"
    t.index ["user_id"], name: "index_searchjoy_searches_on_user_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.bigint "hospital_id"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city_id"
    t.string "state_id"
    t.string "pincode"
    t.string "phone_number"
    t.string "gst_number"
    t.string "dl_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.datetime "dl_expiry"
    t.string "buyer_party_type"
    t.bigint "buyer_party_id"
    t.bigint "pincode_id"
    t.bigint "universal_pincode_id"
    t.index ["buyer_party_type", "buyer_party_id"], name: "index_shipping_addresses_on_buyer_party_type_and_buyer_party_id"
    t.index ["city_id", "tenant_id"], name: "index_shipping_addresses_on_city_id_and_tenant_id"
    t.index ["hospital_id", "tenant_id"], name: "index_shipping_addresses_on_hospital_id_and_tenant_id"
    t.index ["pincode_id"], name: "index_shipping_addresses_on_pincode_id"
    t.index ["state_id", "tenant_id"], name: "index_shipping_addresses_on_state_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_shipping_addresses_on_tenant_id"
    t.index ["universal_pincode_id"], name: "index_shipping_addresses_on_universal_pincode_id"
  end

  create_table "si_item_masters", force: :cascade do |t|
    t.bigint "sales_invoice_item_id"
    t.jsonb "master_sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.string "product_type"
    t.index ["sales_invoice_item_id", "tenant_id"], name: "index_si_item_masters_on_sales_invoice_item_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_si_item_masters_on_tenant_id"
  end

  create_table "si_masters", force: :cascade do |t|
    t.bigint "sales_invoice_id"
    t.jsonb "buyer_party"
    t.jsonb "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "shipping_address"
    t.integer "tenant_id", null: false
    t.index ["sales_invoice_id", "tenant_id"], name: "index_si_masters_on_sales_invoice_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_si_masters_on_tenant_id"
  end

  create_table "sku_locations", force: :cascade do |t|
    t.string "location"
    t.bigint "branch_id"
    t.bigint "master_sku_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.datetime "deleted_at"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_sku_locations_on_branch_id"
    t.index ["created_by_id"], name: "index_sku_locations_on_created_by_id"
    t.index ["deleted_at"], name: "index_sku_locations_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_sku_locations_on_last_updated_by_id"
    t.index ["master_sku_id"], name: "index_sku_locations_on_master_sku_id"
    t.index ["tenant_id"], name: "index_sku_locations_on_tenant_id"
  end

  create_table "so_delivery_challans", force: :cascade do |t|
    t.bigint "sales_order_id"
    t.bigint "delivery_challan_id"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_so_delivery_challans_on_deleted_at"
    t.index ["delivery_challan_id"], name: "index_so_delivery_challans_on_delivery_challan_id"
    t.index ["sales_order_id"], name: "index_so_delivery_challans_on_sales_order_id"
    t.index ["tenant_id"], name: "index_so_delivery_challans_on_tenant_id"
  end

  create_table "so_item_masters", force: :cascade do |t|
    t.bigint "sales_order_item_id"
    t.jsonb "master_sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.index ["sales_order_item_id", "tenant_id"], name: "index_so_item_masters_on_sales_order_item_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_so_item_masters_on_tenant_id"
  end

  create_table "so_masters", force: :cascade do |t|
    t.bigint "sales_order_id"
    t.jsonb "buyer_party", default: {}
    t.jsonb "branch", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tenant_id", null: false
    t.index ["sales_order_id", "tenant_id"], name: "index_so_masters_on_sales_order_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_so_masters_on_tenant_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.string "alt_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.string "gst_state_code"
    t.string "region_code"
    t.bigint "universal_state_id"
    t.index ["created_by_id"], name: "index_states_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_states_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_states_on_tenant_id"
    t.index ["universal_state_id"], name: "index_states_on_universal_state_id"
  end

  create_table "supplier_payment_invoices", force: :cascade do |t|
    t.bigint "supplier_payment_id"
    t.bigint "purchase_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.float "allocated_amount"
    t.integer "tenant_id", null: false
    t.index ["purchase_invoice_id", "tenant_id"], name: "index_supplier_payment_invoices_on_pi_and_tenant"
    t.index ["supplier_payment_id", "tenant_id"], name: "index_supplier_payment_invoices_on_supplier_payment_and_tenant"
    t.index ["tenant_id"], name: "index_supplier_payment_invoices_on_tenant_id"
  end

  create_table "supplier_payment_masters", force: :cascade do |t|
    t.jsonb "branch"
    t.jsonb "supplier"
    t.bigint "supplier_payment_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id", null: false
    t.index ["supplier_payment_id", "tenant_id"], name: "index_supplier_payment_masters_on_supplier_payment_and_tenant"
    t.index ["tenant_id"], name: "index_supplier_payment_masters_on_tenant_id"
  end

  create_table "supplier_payments", force: :cascade do |t|
    t.bigint "supplier_id"
    t.float "payment_amount"
    t.string "payment_mode"
    t.integer "transaction_type"
    t.string "status", default: "draft"
    t.string "reference_number"
    t.datetime "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.float "remaining_amount", default: 0.0
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.string "sap_payment_id"
    t.string "sap_journal_id"
    t.index ["created_by_id"], name: "index_supplier_payments_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_supplier_payments_on_last_updated_by_id"
    t.index ["supplier_id", "tenant_id"], name: "index_supplier_payments_on_supplier_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_supplier_payments_on_tenant_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "legal_name"
    t.string "display_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "pincode"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "gst_number"
    t.string "dl_number"
    t.datetime "portal_activated_at"
    t.datetime "deleted_at"
    t.datetime "last_verified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.integer "rate_contracts_count", default: 0
    t.integer "purchase_orders_count", default: 0
    t.integer "purchase_invoices_count", default: 0
    t.integer "parties_count", default: 0
    t.bigint "state_id"
    t.string "contact_person_name"
    t.string "email"
    t.bigint "created_by_id"
    t.bigint "deleted_by_id"
    t.bigint "last_updated_by_id"
    t.string "fssai_number"
    t.integer "tenant_id", null: false
    t.string "pan_number"
    t.boolean "ignore_tcs", default: true
    t.string "nl_number"
    t.date "fssai_expiry"
    t.date "dl_expiry"
    t.date "nl_expiry"
    t.string "reference"
    t.text "payment_terms"
    t.integer "credit_days"
    t.decimal "credit_limit"
    t.boolean "apply_tcs", default: false
    t.boolean "is_sap_sync", default: false
    t.bigint "branch_id"
    t.boolean "internal_entity", default: false
    t.bigint "universal_supplier_id"
    t.string "msme_number"
    t.date "msme_expiry"
    t.string "schedulex_number"
    t.date "schedulex_expiry"
    t.bigint "pincode_id"
    t.boolean "enabled_for_tenant", default: false
    t.bigint "universal_pincode_id"
    t.index ["branch_id"], name: "index_suppliers_on_branch_id"
    t.index ["city_id"], name: "index_suppliers_on_city_id"
    t.index ["created_by_id"], name: "index_suppliers_on_created_by_id"
    t.index ["deleted_at"], name: "index_suppliers_on_deleted_at"
    t.index ["deleted_by_id"], name: "index_suppliers_on_deleted_by_id"
    t.index ["display_name", "legal_name", "tenant_id"], name: "index_suppliers_on_display_name_and_legal_name_and_tenant_id", unique: true, where: "(deleted_at IS NULL)"
    t.index ["last_updated_by_id"], name: "index_suppliers_on_last_updated_by_id"
    t.index ["pincode_id"], name: "index_suppliers_on_pincode_id"
    t.index ["state_id"], name: "index_suppliers_on_state_id"
    t.index ["tenant_id"], name: "index_suppliers_on_tenant_id"
    t.index ["universal_pincode_id"], name: "index_suppliers_on_universal_pincode_id"
    t.index ["universal_supplier_id"], name: "index_suppliers_on_universal_supplier_id"
  end

  create_table "tag_categories", force: :cascade do |t|
    t.string "name"
    t.string "category_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "tags_count", default: 0
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.index ["created_by_id"], name: "index_tag_categories_on_created_by_id"
    t.index ["id", "name", "deleted_at"], name: "index_tags_on_id_and_name_with_deleted"
    t.index ["last_updated_by_id"], name: "index_tag_categories_on_last_updated_by_id"
    t.index ["tenant_id"], name: "index_tag_categories_on_tenant_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "tag_category_id"
    t.string "value"
    t.boolean "is_verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "master_category_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.integer "tenant_id", null: false
    t.index ["created_by_id"], name: "index_tags_on_created_by_id"
    t.index ["last_updated_by_id"], name: "index_tags_on_last_updated_by_id"
    t.index ["master_category_id", "tenant_id"], name: "index_tags_on_master_category_id_and_tenant_id"
    t.index ["tag_category_id", "tenant_id"], name: "index_tags_on_tag_category_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_tags_on_tenant_id"
  end

  create_table "tax_uploads", force: :cascade do |t|
    t.string "owner_party_type"
    t.bigint "owner_party_id"
    t.boolean "is_mapped", default: false
    t.jsonb "data_mapping"
    t.datetime "deleted_at"
    t.integer "taxes_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tax_uploads_on_deleted_at"
    t.index ["owner_party_type", "owner_party_id"], name: "index_tax_uploads_on_owner_party_type_and_owner_party_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.bigint "tax_upload_id"
    t.string "owner_party_type"
    t.bigint "owner_party_id"
    t.bigint "master_sku_id"
    t.string "code"
    t.text "description"
    t.string "product_name"
    t.string "rate_type"
    t.float "rate"
    t.integer "row_id"
    t.jsonb "row_json"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_taxes_on_deleted_at"
    t.index ["master_sku_id"], name: "index_taxes_on_master_sku_id"
    t.index ["owner_party_type", "owner_party_id"], name: "index_taxes_on_owner_party_type_and_owner_party_id"
    t.index ["tax_upload_id"], name: "index_taxes_on_tax_upload_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name", null: false
    t.string "legal_name", null: false
    t.text "domain_identification", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_url"
    t.string "website_url"
    t.string "pan"
    t.string "cin"
    t.string "registered_office_address"
    t.string "invoice_year", default: "current_year"
    t.string "invoice_format", default: "INVOICE_CODE/YEAR/COUNTER"
    t.string "invoice_counter_format", default: "MIN_FOUR_DIGITS"
    t.string "oms_favicon_apple_touch", default: "https://aknamed-prod-assets.s3.ap-south-1.amazonaws.com/assets/oms-apple-touch-icon-86baf30e23cb9c168d78db3974bed5d961ec854e6ff72643a5beeda19511ac22.png"
    t.string "oms_favicon_32_size", default: "https://aknamed-prod-assets.s3.ap-south-1.amazonaws.com/assets/oms-favicon-32x32-68c9dde0575c1f26387464630b9f683d902e4aa7437ca2e09198571feb4249b8.png"
    t.string "oms_favicon_16_size", default: "https://aknamed-prod-assets.s3.ap-south-1.amazonaws.com/assets/oms-favicon-16x16-0fdedbb6a51e82bbf78d99884abf0bced313fe40eb158c63c966805a68339de7.png"
    t.string "oms_title", default: "Aknamed Admin Management System"
    t.boolean "display_confirmed_by_in_invoice_print", default: false
    t.index ["domain_identification"], name: "index_tenants_on_domain_identification", unique: true
    t.index ["legal_name"], name: "index_tenants_on_legal_name", unique: true
    t.index ["name"], name: "index_tenants_on_name", unique: true
  end

  create_table "universal_bulk_sku_uploads", force: :cascade do |t|
    t.bigint "universal_sku_id"
    t.bigint "bulk_universal_sku_upload_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bulk_universal_sku_upload_id"], name: "index_universal_bulk_sku_uploads"
    t.index ["universal_sku_id"], name: "index_universal_bulk_sku_uploads_on_universal_sku_id"
  end

  create_table "universal_categories", force: :cascade do |t|
    t.string "category_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.index ["created_by_id"], name: "index_universal_categories_on_created_by_id"
    t.index ["id", "deleted_at", "category_type"], name: "index_universal_categories_on_deleted_and_type"
    t.index ["last_updated_by_id"], name: "index_universal_categories_on_last_updated_by_id"
  end

  create_table "universal_cities", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.string "alt_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "universal_state_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.bigint "deleted_by_id"
    t.datetime "deleted_at"
    t.index ["created_by_id"], name: "index_universal_cities_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_universal_cities_on_deleted_by_id"
    t.index ["last_updated_by_id"], name: "index_universal_cities_on_last_updated_by_id"
    t.index ["universal_state_id"], name: "index_universal_cities_on_universal_state_id"
  end

  create_table "universal_companies", force: :cascade do |t|
    t.string "name"
    t.string "group_name"
    t.string "display_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "deleted_by_id"
    t.bigint "last_updated_by_id"
    t.index ["created_by_id"], name: "index_universal_companies_on_created_by_id"
    t.index ["deleted_at"], name: "index_universal_companies_on_deleted_at"
    t.index ["deleted_by_id"], name: "index_universal_companies_on_deleted_by_id"
    t.index ["group_name"], name: "index_universal_companies_on_group_name"
    t.index ["id"], name: "index_universal_companies_on_id"
    t.index ["last_updated_by_id"], name: "index_universal_companies_on_last_updated_by_id"
  end

  create_table "universal_groups", force: :cascade do |t|
    t.string "group_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "updated_by_id"
    t.bigint "deleted_by_id"
    t.index ["deleted_by_id"], name: "index_universal_groups_on_deleted_by_id"
    t.index ["updated_by_id"], name: "index_universal_groups_on_updated_by_id"
  end

  create_table "universal_hospital_entities", force: :cascade do |t|
    t.string "legal_name"
    t.bigint "universal_group_id"
    t.bigint "universal_city_id"
    t.bigint "universal_state_id"
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "deleted_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_universal_hospital_entities_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_universal_hospital_entities_on_deleted_by_id"
    t.index ["universal_city_id"], name: "index_universal_hospital_entities_on_universal_city_id"
    t.index ["universal_group_id"], name: "index_universal_hospital_entities_on_universal_group_id"
    t.index ["universal_state_id"], name: "index_universal_hospital_entities_on_universal_state_id"
    t.index ["updated_by_id"], name: "index_universal_hospital_entities_on_updated_by_id"
  end

  create_table "universal_hospitals", force: :cascade do |t|
    t.string "legal_name"
    t.string "display_name"
    t.string "group_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "pincode"
    t.decimal "lat"
    t.decimal "lng"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "gst_number"
    t.string "dl_number"
    t.string "contact_person_name"
    t.string "email"
    t.string "classification"
    t.string "fssai_number"
    t.string "pan_number"
    t.string "nl_number"
    t.date "fssai_expiry"
    t.date "dl_expiry"
    t.date "nl_expiry"
    t.boolean "internal_entity"
    t.boolean "include_3_month_expiry"
    t.boolean "include_6_month_expiry"
    t.boolean "exclude_multiple_mrp"
    t.boolean "optimise_for_single_batch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "universal_group_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.bigint "deleted_by_id"
    t.datetime "deleted_at"
    t.bigint "universal_state_id"
    t.bigint "universal_city_id"
    t.string "msme_number"
    t.date "msme_expiry"
    t.string "schedulex_number"
    t.date "schedulex_expiry"
    t.bigint "universal_hospital_entity_id"
    t.bigint "universal_pincode_id"
    t.index ["created_by_id"], name: "index_universal_hospitals_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_universal_hospitals_on_deleted_by_id"
    t.index ["last_updated_by_id"], name: "index_universal_hospitals_on_last_updated_by_id"
    t.index ["universal_city_id"], name: "index_universal_hospitals_on_universal_city_id"
    t.index ["universal_group_id"], name: "index_universal_hospitals_on_universal_group_id"
    t.index ["universal_hospital_entity_id"], name: "index_universal_hospitals_on_universal_hospital_entity_id"
    t.index ["universal_pincode_id"], name: "index_universal_hospitals_on_universal_pincode_id"
    t.index ["universal_state_id"], name: "index_universal_hospitals_on_universal_state_id"
  end

  create_table "universal_molecules", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.index ["created_by_id"], name: "index_universal_molecules_on_created_by_id"
    t.index ["deleted_at"], name: "index_universal_molecules_on_deleted_at"
    t.index ["id"], name: "index_universal_molecules_on_id"
    t.index ["last_updated_by_id"], name: "index_universal_molecules_on_last_updated_by_id"
  end

  create_table "universal_pincodes", force: :cascade do |t|
    t.string "number"
    t.datetime "deleted_at"
    t.bigint "universal_state_id"
    t.bigint "universal_city_id"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "deleted_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_universal_pincodes_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_universal_pincodes_on_deleted_by_id"
    t.index ["universal_city_id"], name: "index_universal_pincodes_on_universal_city_id"
    t.index ["universal_state_id"], name: "index_universal_pincodes_on_universal_state_id"
    t.index ["updated_by_id"], name: "index_universal_pincodes_on_updated_by_id"
  end

  create_table "universal_sku_molecules", force: :cascade do |t|
    t.bigint "universal_molecule_id"
    t.bigint "universal_sku_id"
    t.float "strength"
    t.string "unit"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_universal_sku_molecules_on_deleted_at"
    t.index ["universal_molecule_id"], name: "index_universal_sku_molecules_on_universal_molecule_id"
    t.index ["universal_sku_id"], name: "index_universal_sku_molecules_on_universal_sku_id"
  end

  create_table "universal_skus", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "brand_name"
    t.string "brand"
    t.string "product_name"
    t.date "out_of_trade"
    t.string "pack_size"
    t.jsonb "master_sku_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "hsn_code"
    t.boolean "batch_number_optional", default: false
    t.boolean "batch_expiry_optional", default: false
    t.float "gst", default: 0.0
    t.string "temperature"
    t.string "unit_of_measurement"
    t.boolean "dl_required", default: false
    t.boolean "fssai_required", default: false
    t.string "variant"
    t.string "strength"
    t.string "sub_category"
    t.string "schedule_category"
    t.string "manufacturer_code"
    t.boolean "gst_exempted", default: false
    t.boolean "nl_required", default: false
    t.integer "no_of_packs_in_a_box"
    t.string "pack_type"
    t.string "size"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.bigint "universal_category_id"
    t.bigint "universal_company_id"
    t.string "universal_company_division"
    t.integer "unit_pack_size", default: 1
    t.index ["created_by_id"], name: "index_universal_skus_on_created_by_id"
    t.index ["deleted_at"], name: "index_universal_skus_on_deleted_at"
    t.index ["last_updated_by_id"], name: "index_universal_skus_on_last_updated_by_id"
    t.index ["universal_category_id"], name: "index_universal_skus_on_universal_category_id"
    t.index ["universal_company_division"], name: "index_universal_skus_on_universal_company_division"
    t.index ["universal_company_id"], name: "index_universal_skus_on_universal_company_id"
  end

  create_table "universal_states", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.string "alt_name"
    t.string "gst_state_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.bigint "deleted_by_id"
    t.datetime "deleted_at"
    t.index ["created_by_id"], name: "index_universal_states_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_universal_states_on_deleted_by_id"
    t.index ["last_updated_by_id"], name: "index_universal_states_on_last_updated_by_id"
  end

  create_table "universal_suppliers", force: :cascade do |t|
    t.string "legal_name"
    t.string "display_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "pincode"
    t.decimal "lat"
    t.decimal "lng"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "gst_number"
    t.string "dl_number"
    t.string "fssai_number"
    t.string "pan_number"
    t.string "nl_number"
    t.date "fssai_expiry"
    t.date "dl_expiry"
    t.date "nl_expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "universal_state_id"
    t.bigint "universal_city_id"
    t.bigint "created_by_id"
    t.bigint "last_updated_by_id"
    t.bigint "deleted_by_id"
    t.datetime "deleted_at"
    t.string "msme_number"
    t.date "msme_expiry"
    t.string "schedulex_number"
    t.date "schedulex_expiry"
    t.bigint "pincode_id"
    t.bigint "universal_pincode_id"
    t.index ["created_by_id"], name: "index_universal_suppliers_on_created_by_id"
    t.index ["deleted_by_id"], name: "index_universal_suppliers_on_deleted_by_id"
    t.index ["last_updated_by_id"], name: "index_universal_suppliers_on_last_updated_by_id"
    t.index ["pincode_id"], name: "index_universal_suppliers_on_pincode_id"
    t.index ["universal_city_id"], name: "index_universal_suppliers_on_universal_city_id"
    t.index ["universal_pincode_id"], name: "index_universal_suppliers_on_universal_pincode_id"
    t.index ["universal_state_id"], name: "index_universal_suppliers_on_universal_state_id"
  end

  create_table "uom_converters", force: :cascade do |t|
    t.bigint "master_sku_id"
    t.bigint "supplier_id"
    t.bigint "hospital_id"
    t.integer "quantity_per_unit"
    t.string "unit_of_measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_quantity_per_unit"
    t.integer "tenant_id", null: false
    t.index ["hospital_id"], name: "index_uom_converters_on_hospital_id"
    t.index ["master_sku_id"], name: "index_uom_converters_on_master_sku_id"
    t.index ["supplier_id"], name: "index_uom_converters_on_supplier_id"
    t.index ["tenant_id"], name: "index_uom_converters_on_tenant_id"
  end

  create_table "user_hospital_communications", force: :cascade do |t|
    t.bigint "hospital_entity_id"
    t.bigint "user_id"
    t.boolean "email_enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_entity_id", "user_id"], name: "index_user_hospital_communication_uniqueness", unique: true
    t.index ["hospital_entity_id"], name: "index_user_hospital_communications_on_hospital_entity_id"
    t.index ["user_id"], name: "index_user_hospital_communications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "mobile"
    t.string "name"
    t.datetime "deleted_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "city_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "managed_by_id"
    t.string "designation"
    t.integer "default_hospital_id"
    t.integer "aknamed_role_id"
    t.integer "tenant_id", null: false
    t.boolean "dummy_user", default: false
    t.boolean "group_order_confirmation_email_enabled", default: true
    t.boolean "group_order_dispatch_email_enabled", default: true
    t.boolean "group_order_delivery_email_enabled", default: true
    t.boolean "group_order_dispatch_ready_email_enabled", default: true
    t.string "metrics"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "inventory_access", default: false
    t.boolean "onboarded_in_smartchain", default: false
    t.index ["aknamed_role_id", "tenant_id"], name: "index_users_on_aknamed_role_id_and_tenant_id"
    t.index ["city_id", "tenant_id"], name: "index_users_on_city_id_and_tenant_id"
    t.index ["confirmation_token", "tenant_id"], name: "index_users_on_confirmation_token_and_tenant_id"
    t.index ["email", "tenant_id"], name: "index_users_on_email_and_tenant_id"
    t.index ["invitation_token", "tenant_id"], name: "index_users_on_invitation_token_and_tenant_id"
    t.index ["invitations_count", "tenant_id"], name: "index_users_on_invitations_count_and_tenant_id"
    t.index ["invited_by_id", "tenant_id"], name: "index_users_on_invited_by_id_and_tenant_id"
    t.index ["invited_by_type", "invited_by_id", "tenant_id"], name: "index_users_on_invited_by_type_and_invited_by_id_and_tenant_id"
    t.index ["managed_by_id", "tenant_id"], name: "index_users_on_managed_by_id_and_tenant_id"
    t.index ["reset_password_token", "tenant_id"], name: "index_users_on_reset_password_token_and_tenant_id"
    t.index ["tenant_id", "deleted_at", "id"], name: "index_users_with_deleted"
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.boolean "others_group", default: true
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_number"
    t.string "vehicle_type"
    t.bigint "branch_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dispatches_count"
    t.integer "tenant_id", null: false
    t.boolean "enabled_for_dispatch", default: true
    t.index ["branch_id", "tenant_id"], name: "index_vehicles_on_branch_id_and_tenant_id"
    t.index ["deleted_at"], name: "index_vehicles_on_deleted_at"
    t.index ["tenant_id"], name: "index_vehicles_on_tenant_id"
    t.index ["vehicle_number"], name: "index_vehicles_on_vehicle_number"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.string "foreign_type"
    t.index ["foreign_key_name", "foreign_key_id", "foreign_type"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.integer "transaction_id"
    t.json "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
    t.index ["whodunnit", "created_at"], name: "idx_whodunnit_created_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "aknamed_roles", "users", column: "created_by_id"
  add_foreign_key "aknamed_roles", "users", column: "last_updated_by_id"
  add_foreign_key "branch_sales_rc_uploads", "branches"
  add_foreign_key "branch_sales_rc_uploads", "sales_rc_uploads"
  add_foreign_key "branch_sales_rcs", "branches"
  add_foreign_key "branch_sales_rcs", "sales_rate_contracts"
  add_foreign_key "branches", "pincodes"
  add_foreign_key "branches", "states"
  add_foreign_key "branches", "universal_pincodes"
  add_foreign_key "branches", "users", column: "created_by_id"
  add_foreign_key "branches", "users", column: "deleted_by_id"
  add_foreign_key "branches", "users", column: "last_updated_by_id"
  add_foreign_key "bulk_product_uploads", "users", column: "created_by_id"
  add_foreign_key "bulk_product_uploads", "users", column: "last_updated_by_id"
  add_foreign_key "bulk_sku_uploads", "users", column: "created_by_id"
  add_foreign_key "bulk_sku_uploads", "users", column: "last_updated_by_id"
  add_foreign_key "bulk_universal_sku_uploads", "users", column: "created_by_id"
  add_foreign_key "bulk_universal_sku_uploads", "users", column: "last_updated_by_id"
  add_foreign_key "challan_return_items", "users", column: "created_by_id"
  add_foreign_key "challan_return_items", "users", column: "last_updated_by_id"
  add_foreign_key "challan_returns", "users", column: "created_by_id"
  add_foreign_key "challan_returns", "users", column: "last_updated_by_id"
  add_foreign_key "cities", "states"
  add_foreign_key "cities", "universal_cities"
  add_foreign_key "cities", "users", column: "created_by_id"
  add_foreign_key "cities", "users", column: "last_updated_by_id"
  add_foreign_key "company_division_accesses", "master_companies"
  add_foreign_key "company_division_accesses", "users"
  add_foreign_key "company_partner_branches", "branches"
  add_foreign_key "company_partner_branches", "company_partners"
  add_foreign_key "company_partner_branches", "tenants"
  add_foreign_key "company_partners", "master_companies"
  add_foreign_key "company_partners", "suppliers"
  add_foreign_key "company_partners", "tenants"
  add_foreign_key "company_partners", "users", column: "created_by_id"
  add_foreign_key "company_partners", "users", column: "last_updated_by_id"
  add_foreign_key "credit_note_items", "users", column: "created_by_id"
  add_foreign_key "credit_note_items", "users", column: "last_updated_by_id"
  add_foreign_key "credit_notes", "users", column: "confirmed_by_id"
  add_foreign_key "credit_notes", "users", column: "created_by_id"
  add_foreign_key "credit_notes", "users", column: "last_updated_by_id"
  add_foreign_key "dc_item_masters", "delivery_challan_items"
  add_foreign_key "dc_masters", "delivery_challans"
  add_foreign_key "debit_note_items", "users", column: "created_by_id"
  add_foreign_key "debit_note_items", "users", column: "last_updated_by_id"
  add_foreign_key "debit_notes", "users", column: "confirmed_by_id"
  add_foreign_key "debit_notes", "users", column: "created_by_id"
  add_foreign_key "debit_notes", "users", column: "last_updated_by_id"
  add_foreign_key "delivery_challan_items", "users", column: "created_by_id"
  add_foreign_key "delivery_challan_items", "users", column: "last_updated_by_id"
  add_foreign_key "delivery_challans", "cities"
  add_foreign_key "delivery_challans", "pincodes"
  add_foreign_key "delivery_challans", "states"
  add_foreign_key "delivery_challans", "universal_pincodes"
  add_foreign_key "delivery_challans", "users", column: "created_by_id"
  add_foreign_key "delivery_challans", "users", column: "last_updated_by_id"
  add_foreign_key "dispatch_delivery_challans", "delivery_challans"
  add_foreign_key "dispatch_delivery_challans", "dispatches"
  add_foreign_key "dispatches", "users", column: "delivery_executive_id"
  add_foreign_key "dtp_groups", "users", column: "created_by_id"
  add_foreign_key "dtp_groups", "users", column: "last_updated_by_id"
  add_foreign_key "features", "users", column: "created_by_id"
  add_foreign_key "features", "users", column: "last_updated_by_id"
  add_foreign_key "get_quotes", "master_skus"
  add_foreign_key "get_quotes", "users"
  add_foreign_key "groups", "universal_groups"
  add_foreign_key "hospital_entities", "groups"
  add_foreign_key "hospital_entities", "tenants"
  add_foreign_key "hospital_entities", "universal_hospital_entities"
  add_foreign_key "hospital_entities", "users", column: "created_by_id"
  add_foreign_key "hospital_entities", "users", column: "deleted_by_id"
  add_foreign_key "hospital_entities", "users", column: "updated_by_id"
  add_foreign_key "hospital_grn_items", "users", column: "created_by_id"
  add_foreign_key "hospital_grn_items", "users", column: "last_updated_by_id"
  add_foreign_key "hospital_grns", "users", column: "created_by_id"
  add_foreign_key "hospital_grns", "users", column: "last_updated_by_id"
  add_foreign_key "hospital_master_informations", "hospital_masters"
  add_foreign_key "hospital_masters", "groups"
  add_foreign_key "hospital_masters", "hospitals"
  add_foreign_key "hospital_masters", "master_skus"
  add_foreign_key "hospital_masters", "users", column: "created_by_id"
  add_foreign_key "hospital_masters", "users", column: "mapped_by_id"
  add_foreign_key "hospital_masters", "users", column: "updated_by_id"
  add_foreign_key "hospital_payment_hospitals", "hospital_payments"
  add_foreign_key "hospital_payment_hospitals", "hospitals"
  add_foreign_key "hospital_payment_invoices", "hospital_payments"
  add_foreign_key "hospital_payment_invoices", "sales_invoices"
  add_foreign_key "hospital_payment_masters", "hospital_payments"
  add_foreign_key "hospital_payments", "banks"
  add_foreign_key "hospital_payments", "groups"
  add_foreign_key "hospital_payments", "users", column: "created_by_id"
  add_foreign_key "hospital_payments", "users", column: "last_updated_by_id"
  add_foreign_key "hospital_rate_contracts", "groups"
  add_foreign_key "hospital_rate_contracts", "users", column: "created_by_id"
  add_foreign_key "hospital_rate_contracts", "users", column: "last_updated_by_id"
  add_foreign_key "hospitals", "groups"
  add_foreign_key "hospitals", "pincodes"
  add_foreign_key "hospitals", "states"
  add_foreign_key "hospitals", "universal_hospitals"
  add_foreign_key "hospitals", "universal_pincodes"
  add_foreign_key "hospitals", "users", column: "created_by_id"
  add_foreign_key "hospitals", "users", column: "last_updated_by_id"
  add_foreign_key "import_files", "users", column: "created_by_id"
  add_foreign_key "import_files", "users", column: "last_updated_by_id"
  add_foreign_key "inventories", "users", column: "created_by_id"
  add_foreign_key "inventories", "users", column: "last_updated_by_id"
  add_foreign_key "invoice_formats", "branches"
  add_foreign_key "invoice_formats", "order_types"
  add_foreign_key "invoice_formats", "tenants"
  add_foreign_key "invoice_formats", "users", column: "created_by_id"
  add_foreign_key "invoice_formats", "users", column: "last_updated_by_id"
  add_foreign_key "master_categories", "universal_categories"
  add_foreign_key "master_categories", "users", column: "created_by_id"
  add_foreign_key "master_categories", "users", column: "last_updated_by_id"
  add_foreign_key "master_companies", "universal_companies"
  add_foreign_key "master_companies", "users", column: "created_by_id"
  add_foreign_key "master_companies", "users", column: "deleted_by_id"
  add_foreign_key "master_companies", "users", column: "last_updated_by_id"
  add_foreign_key "master_company_divisions", "company_partners"
  add_foreign_key "master_company_divisions", "master_companies"
  add_foreign_key "master_company_divisions", "tenants"
  add_foreign_key "master_molecules", "universal_molecules"
  add_foreign_key "master_molecules", "users", column: "created_by_id"
  add_foreign_key "master_molecules", "users", column: "last_updated_by_id"
  add_foreign_key "master_patients", "cities"
  add_foreign_key "master_patients", "pincodes"
  add_foreign_key "master_patients", "states"
  add_foreign_key "master_patients", "tenants"
  add_foreign_key "master_patients", "universal_pincodes"
  add_foreign_key "master_patients", "users", column: "created_by_id"
  add_foreign_key "master_patients", "users", column: "deleted_by_id"
  add_foreign_key "master_patients", "users", column: "updated_by_id"
  add_foreign_key "master_sku_molecules", "master_molecules"
  add_foreign_key "master_sku_molecules", "master_skus"
  add_foreign_key "master_skus", "branches", column: "current_mrp_branch_id"
  add_foreign_key "master_skus", "master_categories"
  add_foreign_key "master_skus", "master_sku_categories"
  add_foreign_key "master_skus", "original_manufacturers"
  add_foreign_key "master_skus", "universal_skus"
  add_foreign_key "master_skus", "users", column: "created_by_id"
  add_foreign_key "master_skus", "users", column: "last_updated_by_id"
  add_foreign_key "master_tag_categories", "master_categories"
  add_foreign_key "master_tag_categories", "tag_categories"
  add_foreign_key "order_fulfillments", "sales_orders"
  add_foreign_key "order_types", "tenants"
  add_foreign_key "order_types", "users", column: "created_by_id"
  add_foreign_key "order_types", "users", column: "last_updated_by_id"
  add_foreign_key "original_manufacturers", "users", column: "created_by_id"
  add_foreign_key "original_manufacturers", "users", column: "last_updated_by_id"
  add_foreign_key "patient_payment_invoices", "patient_payments"
  add_foreign_key "patient_payment_invoices", "sales_invoices"
  add_foreign_key "patient_payment_invoices", "tenants"
  add_foreign_key "patient_payments", "banks"
  add_foreign_key "patient_payments", "payers"
  add_foreign_key "patient_payments", "tenants"
  add_foreign_key "patient_payments", "users", column: "created_by_id"
  add_foreign_key "patient_payments", "users", column: "last_updated_by_id"
  add_foreign_key "payers", "users", column: "created_by_id"
  add_foreign_key "payers", "users", column: "deleted_by_id"
  add_foreign_key "payers", "users", column: "last_updated_by_id"
  add_foreign_key "pick_list_items", "users", column: "created_by_id"
  add_foreign_key "pick_list_items", "users", column: "last_updated_by_id"
  add_foreign_key "pick_lists", "users", column: "created_by_id"
  add_foreign_key "pick_lists", "users", column: "last_updated_by_id"
  add_foreign_key "pincodes", "universal_cities"
  add_foreign_key "pincodes", "universal_states"
  add_foreign_key "pincodes", "users", column: "created_by_id"
  add_foreign_key "pincodes", "users", column: "deleted_by_id"
  add_foreign_key "pincodes", "users", column: "updated_by_id"
  add_foreign_key "printouts", "tenants"
  add_foreign_key "printouts", "users", column: "created_by_id"
  add_foreign_key "printouts", "users", column: "last_updated_by_id"
  add_foreign_key "purchase_invoice_items", "users", column: "created_by_id"
  add_foreign_key "purchase_invoice_items", "users", column: "last_updated_by_id"
  add_foreign_key "purchase_invoices", "users", column: "created_by_id"
  add_foreign_key "purchase_invoices", "users", column: "last_updated_by_id"
  add_foreign_key "purchase_order_items", "users", column: "created_by_id"
  add_foreign_key "purchase_order_items", "users", column: "last_updated_by_id"
  add_foreign_key "purchase_orders", "users", column: "created_by_id"
  add_foreign_key "purchase_orders", "users", column: "last_updated_by_id"
  add_foreign_key "purchase_rate_contracts", "master_skus"
  add_foreign_key "purchase_rate_contracts", "purchase_rc_uploads"
  add_foreign_key "purchase_rate_contracts", "users", column: "created_by_id"
  add_foreign_key "purchase_rate_contracts", "users", column: "last_updated_by_id"
  add_foreign_key "purchase_return_items", "master_skus"
  add_foreign_key "purchase_return_items", "purchase_invoice_items"
  add_foreign_key "purchase_return_items", "purchase_returns"
  add_foreign_key "purchase_returns", "branches"
  add_foreign_key "purchase_returns", "purchase_invoices"
  add_foreign_key "quarantines", "users", column: "created_by_id"
  add_foreign_key "quarantines", "users", column: "last_updated_by_id"
  add_foreign_key "sales_invoice_items", "pick_list_items"
  add_foreign_key "sales_invoice_items", "users", column: "created_by_id"
  add_foreign_key "sales_invoice_items", "users", column: "last_updated_by_id"
  add_foreign_key "sales_invoice_uploads", "users", column: "created_by_id"
  add_foreign_key "sales_invoice_uploads", "users", column: "last_updated_by_id"
  add_foreign_key "sales_invoices", "delivery_challans"
  add_foreign_key "sales_invoices", "pick_lists"
  add_foreign_key "sales_invoices", "users", column: "confirmed_by_id"
  add_foreign_key "sales_invoices", "users", column: "created_by_id"
  add_foreign_key "sales_invoices", "users", column: "last_updated_by_id"
  add_foreign_key "sales_order_items", "delivery_challan_items"
  add_foreign_key "sales_order_items", "users", column: "created_by_id"
  add_foreign_key "sales_order_items", "users", column: "last_updated_by_id"
  add_foreign_key "sales_orders", "delivery_challans"
  add_foreign_key "sales_orders", "users", column: "created_by_id"
  add_foreign_key "sales_orders", "users", column: "last_updated_by_id"
  add_foreign_key "sales_rate_contracts", "master_skus"
  add_foreign_key "sales_rate_contracts", "sales_rc_uploads"
  add_foreign_key "sales_rate_contracts", "users", column: "created_by_id"
  add_foreign_key "sales_rate_contracts", "users", column: "last_updated_by_id"
  add_foreign_key "sales_return_items", "users", column: "created_by_id"
  add_foreign_key "sales_return_items", "users", column: "last_updated_by_id"
  add_foreign_key "sales_returns", "users", column: "created_by_id"
  add_foreign_key "sales_returns", "users", column: "last_updated_by_id"
  add_foreign_key "shipping_addresses", "hospitals"
  add_foreign_key "shipping_addresses", "pincodes"
  add_foreign_key "shipping_addresses", "universal_pincodes"
  add_foreign_key "si_item_masters", "sales_invoice_items"
  add_foreign_key "si_masters", "sales_invoices"
  add_foreign_key "sku_locations", "branches"
  add_foreign_key "sku_locations", "master_skus"
  add_foreign_key "sku_locations", "users", column: "created_by_id"
  add_foreign_key "sku_locations", "users", column: "last_updated_by_id"
  add_foreign_key "so_item_masters", "sales_order_items", on_delete: :cascade
  add_foreign_key "so_masters", "sales_orders"
  add_foreign_key "states", "universal_states"
  add_foreign_key "states", "users", column: "created_by_id"
  add_foreign_key "states", "users", column: "last_updated_by_id"
  add_foreign_key "supplier_payment_invoices", "purchase_invoices"
  add_foreign_key "supplier_payment_invoices", "supplier_payments"
  add_foreign_key "supplier_payment_masters", "supplier_payments"
  add_foreign_key "supplier_payments", "suppliers"
  add_foreign_key "supplier_payments", "users", column: "created_by_id"
  add_foreign_key "supplier_payments", "users", column: "last_updated_by_id"
  add_foreign_key "suppliers", "pincodes"
  add_foreign_key "suppliers", "states"
  add_foreign_key "suppliers", "universal_pincodes"
  add_foreign_key "suppliers", "universal_suppliers"
  add_foreign_key "suppliers", "users", column: "created_by_id"
  add_foreign_key "suppliers", "users", column: "deleted_by_id"
  add_foreign_key "suppliers", "users", column: "last_updated_by_id"
  add_foreign_key "tag_categories", "users", column: "created_by_id"
  add_foreign_key "tag_categories", "users", column: "last_updated_by_id"
  add_foreign_key "tags", "master_categories"
  add_foreign_key "tags", "users", column: "created_by_id"
  add_foreign_key "tags", "users", column: "last_updated_by_id"
  add_foreign_key "universal_categories", "users", column: "created_by_id"
  add_foreign_key "universal_categories", "users", column: "last_updated_by_id"
  add_foreign_key "universal_cities", "universal_states"
  add_foreign_key "universal_cities", "users", column: "created_by_id"
  add_foreign_key "universal_cities", "users", column: "deleted_by_id"
  add_foreign_key "universal_cities", "users", column: "last_updated_by_id"
  add_foreign_key "universal_companies", "users", column: "created_by_id"
  add_foreign_key "universal_companies", "users", column: "deleted_by_id"
  add_foreign_key "universal_companies", "users", column: "last_updated_by_id"
  add_foreign_key "universal_groups", "users", column: "deleted_by_id"
  add_foreign_key "universal_groups", "users", column: "updated_by_id"
  add_foreign_key "universal_hospital_entities", "universal_cities"
  add_foreign_key "universal_hospital_entities", "universal_groups"
  add_foreign_key "universal_hospital_entities", "universal_states"
  add_foreign_key "universal_hospital_entities", "users", column: "created_by_id"
  add_foreign_key "universal_hospital_entities", "users", column: "deleted_by_id"
  add_foreign_key "universal_hospital_entities", "users", column: "updated_by_id"
  add_foreign_key "universal_hospitals", "universal_cities"
  add_foreign_key "universal_hospitals", "universal_groups"
  add_foreign_key "universal_hospitals", "universal_hospital_entities"
  add_foreign_key "universal_hospitals", "universal_pincodes"
  add_foreign_key "universal_hospitals", "universal_states"
  add_foreign_key "universal_hospitals", "users", column: "created_by_id"
  add_foreign_key "universal_hospitals", "users", column: "deleted_by_id"
  add_foreign_key "universal_hospitals", "users", column: "last_updated_by_id"
  add_foreign_key "universal_molecules", "users", column: "created_by_id"
  add_foreign_key "universal_molecules", "users", column: "last_updated_by_id"
  add_foreign_key "universal_pincodes", "universal_cities"
  add_foreign_key "universal_pincodes", "universal_states"
  add_foreign_key "universal_pincodes", "users", column: "created_by_id"
  add_foreign_key "universal_pincodes", "users", column: "deleted_by_id"
  add_foreign_key "universal_pincodes", "users", column: "updated_by_id"
  add_foreign_key "universal_sku_molecules", "universal_molecules"
  add_foreign_key "universal_sku_molecules", "universal_skus"
  add_foreign_key "universal_skus", "universal_categories"
  add_foreign_key "universal_skus", "universal_companies"
  add_foreign_key "universal_skus", "users", column: "created_by_id"
  add_foreign_key "universal_skus", "users", column: "last_updated_by_id"
  add_foreign_key "universal_states", "users", column: "created_by_id"
  add_foreign_key "universal_states", "users", column: "deleted_by_id"
  add_foreign_key "universal_states", "users", column: "last_updated_by_id"
  add_foreign_key "universal_suppliers", "pincodes"
  add_foreign_key "universal_suppliers", "universal_cities"
  add_foreign_key "universal_suppliers", "universal_pincodes"
  add_foreign_key "universal_suppliers", "universal_states"
  add_foreign_key "universal_suppliers", "users", column: "created_by_id"
  add_foreign_key "universal_suppliers", "users", column: "deleted_by_id"
  add_foreign_key "universal_suppliers", "users", column: "last_updated_by_id"
  add_foreign_key "user_hospital_communications", "hospital_entities"
  add_foreign_key "user_hospital_communications", "users"
end
