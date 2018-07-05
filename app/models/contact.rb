class Contact < ApplicationRecord
    belongs_to :user
    validates :first_name,:last_name, :phone, presence:true
    before_save :titleize_fields
    before_save :downcase_fields
    mount_uploader :image, ImageUploader

    def titleize_fields
      self.first_name = first_name.titleize
      self.last_name = last_name.titleize
    end

    def downcase_fields
      self.email.downcase!
    end

    def first_name_with_last_name_and_phone
        "#{first_name} "" #{last_name} - #{phone}"
    end

    def self.import(file, user)
      CSV.foreach(file.path, headers:true) do |row|
      contact = find_by(id: row["id"]) || new
      contact.attributes = row.to_hash
      contact.user = user
      contact.save!
    end
  end
end
