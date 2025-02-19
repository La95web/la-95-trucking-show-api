class Product < ApplicationRecord
  enum :language, %i[spanish english]

  has_one_attached :main_image
  has_many_attached :gallery

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: { in: 0...100_000 }
  validates :stripe_id, presence: true, uniqueness: true
  validates :language, inclusion: { in: languages.keys }
end
