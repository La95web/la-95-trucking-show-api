class Article < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_one_attached :main_image
  has_one_attached :thumbnail

  validates :title, presence: true, length: { in: 5..100 }
  validates :uploaded_at, presence: true
  validates :type, presence: true, inclusion: { in: %w[News Tip] }
end
