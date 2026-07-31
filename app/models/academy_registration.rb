class AcademyRegistration < ApplicationRecord
  validates :full_name, :email, :phone, :has_cdl, :driving_experience, presence: true
end
