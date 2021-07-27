class Contact < ApplicationRecord
  validates :full_name, :email, :number, :address, :message, presence: true
end
