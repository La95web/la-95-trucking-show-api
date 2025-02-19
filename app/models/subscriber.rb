class Subscriber < ApplicationRecord
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
end
