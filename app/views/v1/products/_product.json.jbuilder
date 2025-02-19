json.call(product, :id, :title, :language, :description, :featured, :stripe_id, :price, :created_at, :updated_at)

if product.main_image.attached?
  json.main_image_url rails_blob_url(product.main_image, only_path: false)
else
  json.main_image_url nil
end

if product.gallery.attached?
  json.gallery_urls product.gallery.map { |image| rails_blob_url(image, only_path: false) }
else
  json.gallery_urls []
end
