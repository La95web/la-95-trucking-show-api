class Podcast < ApplicationRecord
  enum :language, %i[spanish english]

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :title, length: { in: 5..100 }
  validates :video_url, presence: true
  validates :uploaded_at, presence: true
  validates :language, inclusion: { in: Podcast.languages.keys }
end
