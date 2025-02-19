class ContactSubmission < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :message, presence: true, length: { maximum: 500 }
end
