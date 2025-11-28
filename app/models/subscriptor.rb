class Subscriptor < ApplicationRecord
  enum :status, { active: 0, inactive: 1, pending: 2, canceled: 3, schedule_cancellation: 4, refunded: 5 }

  def self.generate_qr_id
    loop do
      code = SecureRandom.alphanumeric(7).upcase
      break code unless Subscriptor.exists?(qr_id: code)
    end
  end
end
