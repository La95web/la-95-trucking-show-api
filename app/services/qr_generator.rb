require "rqrcode"
require "chunky_png"

class QrGenerator
  def self.generate_png(qr_id)
    url = "http://localhost:5500/subscriptors/#{qr_id}" # URL que se codifica en el QR
    qr = RQRCode::QRCode.new(url)

    qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      size: 300
    )
  end
end
