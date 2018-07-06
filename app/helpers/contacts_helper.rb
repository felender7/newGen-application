module ContactsHelper
  def show_avatar(contact)
    if contact.image?
      image_tag(contact.image_url(:thumb), class: 'avatar-circle')
    else
      render partial: 'contacts/shared/avatar'
    end
  end
end
