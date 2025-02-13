json.call(section, :id, :heading, :body)

if section.image.attached?
  json.image_url url_for(section.image)
else
  json.image_url nil
end
