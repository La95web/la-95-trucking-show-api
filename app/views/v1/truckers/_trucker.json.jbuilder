json.extract!(trucker, :id, :company, :description, :location, :salary, :experience, :requirements, :qualities, :language, :uploaded_at, :created_at)

if trucker.main_image.attached?
  json.main_image_url rails_blob_url(trucker.main_image, only_path: false)
else
  json.main_image_url nil
end

if trucker.thumbnail.attached?
  json.thumbnail_url rails_blob_url(trucker.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end
