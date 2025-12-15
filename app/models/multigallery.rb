class Multigallery < ApplicationRecord
  has_many_attached :video
  has_many_attached :thumbnail
  has_many_attached :gallery

  validate :thumbnail_limit
  validates :uploaded_at, presence: true

  private
  def thumbnail_limit
    if thumbnail.attachments.count > 8
      errors.add(:thumbnail, "solo puedes subir un maximo de 8 imagenes")
    end
  end
end
