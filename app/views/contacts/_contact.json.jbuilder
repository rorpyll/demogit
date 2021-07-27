json.extract! contact, :id, :full_name, :email, :number, :address, :message, :created_at, :updated_at
json.url contact_url(contact, format: :json)
