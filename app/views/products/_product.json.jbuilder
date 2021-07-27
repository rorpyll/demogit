json.extract! product, :id, :branch_name, :image, :title, :description, :price, :product_type, :model_number, :created_at, :updated_at
json.url product_url(product, format: :json)