class Article < ApplicationRecord
  enum :language, %i[spanish english]

  has_many :sections, dependent: :destroy
  has_one_attached :main_image
  has_one_attached :thumbnail
  has_one_attached :poster
  has_one_attached :video

  validates :title, length: { in: 5..100 }, allow_blank: true
  validates :titlevideo, length: { maximum: 100 }, allow_blank: true
  validates :description, length: { maximum: 255 }, allow_blank: true
  validates :content, length: { maximum: 500 }
  validates :uploaded_at, presence: true
  validates :type, presence: true, inclusion: { in: %w[News Tip Trailer Doctip Trailervideo Tractorvideo Documentvideo Allnewvideo] }
  validates :language, inclusion: { in: Article.languages.keys }
end
