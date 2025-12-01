require "rqrcode"
require "chunky_png"

module V1
  class SubscriptorsController < ApplicationController
    def show
      subscriptor = Subscriptor.find_by(qr_id: params[:qr_id])
      if subscriptor
        render json: subscriptor
      else
        render json: { error: "Subscriptor not found" }, status: :not_found
      end
    end

    def qr
      subscriptor = Subscriptor.find_by(qr_id: params[:qr_id])
      if subscriptor
        qr = RQRCode::QRCode.new("#{ENV.fetch("PUBLIC_FRONTEND_URL", "https://la95truckingshow.com/")}/subscriptors/#{subscriptor.qr_id}")
        png = qr.as_png(size: 300)
        send_data png.to_s, type: "image/png", disposition: "inline"
      else
        head :not_found
      end
    end
  end
end
