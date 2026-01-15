class Realstate < ApplicationRecord
  enum :language, %i[spanish english]

  has_one_attached :main_image
  has_one_attached :thumbnail

  validates :price, length: { maximum: 15 }, allow_blank: true
  validates :rooms, length: { maximum: 10 }, allow_blank: true
  validates :location, length: { maximum: 15 }, allow_blank: true
  validates :internet, length: { maximum: 5 }, allow_blank: true
  validates :parking, length: { maximum: 20 }, allow_blank: true
  validates :furniture, length: { maximum: 20 }, allow_blank: true
  validates :description, length: { maximum: 100 }, allow_blank: true
  validates :language, inclusion: { in: Realstate.languages.keys }
end
