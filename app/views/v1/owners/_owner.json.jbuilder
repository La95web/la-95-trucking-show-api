json.extract!(owner, :id, :company, :description, :location, :salary, :experience, :qualities, :language, :uploaded_at, :created_at)

if owner.main_image.attached?
  json.main_image_url rails_blob_url(owner.main_image, only_path: false)
else
  json.main_image_url nil
end

if owner.thumbnail.attached?
  json.thumbnail_url rails_blob_url(owner.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end
