class HomeController < ApplicationController
 before_action :authenticate_user!
  def index
      @compose_messages_count = current_user.compose_messages.all.count
      @contacts_count = current_user.contacts.all.count
  end

  def welcome

  end
end
