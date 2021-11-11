json.extract! listing, :id, :name, :price, :category, :console_compatibility, :functional_condition, :cosmetic_condition, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
