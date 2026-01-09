class Trucker < ApplicationRecord
  enum :language, %i[spanish english]

  has_one_attached :main_image
  has_one_attached :thumbnail

  validates :company, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 255 }, allow_blank: true
  validates :location, length: { maximum: 100 }, allow_blank: true
  validates :salary, length: { maximum: 50 }, allow_blank: true
  validates :experience, length: { maximum: 100 }, allow_blank: true
  validates :requirements, length: { maximum: 500 }, allow_blank: true
  validates :qualities, length: { maximum: 500 }, allow_blank: true
  validates :language, inclusion: { in: Trucker.languages.keys }
end
