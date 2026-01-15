json.extract!(realstate, :id, :price, :rooms, :location, :internet, :parking, :furniture, :description, :language, :uploaded_at, :created_at)

if realstate.main_image.attached?
  json.main_image_url rails_blob_url(realstate.main_image, only_path: false)
else
  json.main_image_url nil
end

if realstate.thumbnail.attached?
  json.thumbnail_url rails_blob_url(realstate.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end
