class Audio < ApplicationRecord
  has_one_attached :main_audio

  validates :title, presence: true, length: { maximum: 90 }
  validates :uploaded_at, presence: true
end
