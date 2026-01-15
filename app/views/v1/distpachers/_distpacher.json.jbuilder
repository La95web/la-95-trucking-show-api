json.extract!(distpacher, :id, :company, :description, :location, :salary, :experience, :requirements, :qualities, :language, :uploaded_at, :created_at)

if distpacher.main_image.attached?
  json.main_image_url rails_blob_url(distpacher.main_image, only_path: false)
else
  json.main_image_url nil
end

if distpacher.thumbnail.attached?
  json.thumbnail_url rails_blob_url(distpacher.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end