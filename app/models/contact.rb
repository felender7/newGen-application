class Contact < ApplicationRecord
  validates :full_name, :phone, presence:true
  belongs_to :user
end
