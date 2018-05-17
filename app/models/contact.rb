class Contact < ApplicationRecord
  validates :full_name, :phone, presence:true
end
