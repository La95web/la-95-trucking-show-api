class Marketplace < ApplicationRecord
  enum :language, %i[spanish english]

  has_one_attached :main_image
  has_one_attached :thumbnail

  validates :title, presence: true, length: { maximum: 25 }
  validates :content, length: { maximum: 30 }
  validates :uploaded_at, presence: true
  validates :language, inclusion: { in: Marketplace.languages.keys }
  validates :paragraphs, length: { maximum: 197 }, allow_blank: true
end
