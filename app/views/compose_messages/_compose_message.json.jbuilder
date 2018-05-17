json.extract! compose_message, :id, :recipient, :message, :created_at, :updated_at
json.url compose_message_url(compose_message, format: :json)
