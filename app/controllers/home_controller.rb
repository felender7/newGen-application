class HomeController < ApplicationController

  def index
      @compose_messages_count = ComposeMessage.all.count
      @contacts_count = Contact.all.count
  end

  def welcome

  end
end
