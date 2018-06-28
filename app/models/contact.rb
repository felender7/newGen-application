class Contact < ApplicationRecord
    belongs_to :user
    validates :full_name, :phone, presence:true
    mount_uploader :avatar, AvatarUploader
      def self.import(file, user)
        CSV.foreach(file.path, headers:true) do |row|
        contact = find_by(id: row["id"]) || new
        contact.attributes = row.to_hash
        contact.user = user
        contact.save!
      end
  end

end
