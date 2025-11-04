json.call(marketplace, :id, :title, :language, :content, :paragraphs, :uploaded_at, :created_at)

if marketplace.main_image.attached?
  json.main_image_url rails_blob_url(marketplace.main_image, only_path: false)
else
  json.main_image_url nil
end

if marketplace.thumbnail.attached?
  json.thumbnail_url rails_blob_url(marketplace.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end
