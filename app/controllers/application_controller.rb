class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :counters


 protected
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
       devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
     end

     def after_sign_in_path_for(resource)
       request.env['omniauth.origin'] || stored_location_for(resource) || home_path
     end

   def counters
     @compose_messages_count = current_user.compose_messages.all.count
     @contacts_count = current_user.contacts.all.count
     @compose_messages = current_user.compose_messages.all.order('Created_at DESC')
     @credit_balance = 500 - @compose_messages_count
   end
end
