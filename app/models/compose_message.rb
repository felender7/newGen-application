class ComposeMessage < ApplicationRecord
  validates :recipient, :message, presence:true
  belongs_to :user


end
