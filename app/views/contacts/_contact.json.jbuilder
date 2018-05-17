json.extract! contact, :id, :firts_name, :last_name, :phone, :created_at, :updated_at
json.url contact_url(contact, format: :json)
