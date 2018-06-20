json.extract! request_form, :id, :first_name, :last_name, :phone, :email, :created_at, :updated_at
json.url request_form_url(request_form, format: :json)
