class HomeController < ApplicationController
 before_action :authenticate_user!
  def index
      @compose_messages_count = current_user.compose_messages.all.count
      @contacts_count = current_user.contacts.all.count
      @compose_messages = current_user.compose_messages.all.order('Created_at DESC')
      @credit_balance = 500 - @compose_messages_count
  end

  def welcome

  end
end
