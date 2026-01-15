class Owner < ApplicationRecord
  enum :language, %i[spanish english]

  has_one_attached :main_image
  has_one_attached :thumbnail

  validates :company, presence: true, length: { maximum: 27 }
  validates :description, length: { maximum: 120 }, allow_blank: true
  validates :location, length: { maximum: 20 }, allow_blank: true
  validates :salary, length: { maximum: 10 }, allow_blank: true
  validates :experience, length: { maximum: 20 }, allow_blank: true
  validates :qualities, length: { maximum: 15 }, allow_blank: true
  validates :language, inclusion: { in: Owner.languages.keys }
end
