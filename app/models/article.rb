class Article < ApplicationRecord
  enum :language, %i[spanish english]

  has_many :sections, dependent: :destroy
  has_one_attached :main_image
  has_one_attached :thumbnail

  validates :title, presence: true, length: { in: 5..100 }
  validates :content, length: { maximum: 500 }
  validates :uploaded_at, presence: true
  validates :type, presence: true, inclusion: { in: %w[News Tip Trailer] }
  validates :language, inclusion: { in: Article.languages.keys }
end
