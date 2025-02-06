class Section < ApplicationRecord
  belongs_to :article
  has_one_attached :image

  validates :heading, presence: true, length: { in: 5..100 }
  validates :body, presence: true, length: { in: 5..1000 }
end
