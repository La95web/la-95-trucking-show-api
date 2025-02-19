json.call(section, :id, :heading, :body)

if section.image.attached?
  json.image_url rails_blob_url(section.image, only_path: false)
else
  json.image_url nil
end
