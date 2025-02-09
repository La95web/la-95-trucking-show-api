json.call(article, :id, :title, :type, :uploaded_at, :created_at, :updated_at)

if article.main_image.attached?
  json.main_image_url url_for(article.main_image)
else
  json.main_image_url nil
end

if article.thumbnail.attached?
  json.thumbnail_url url_for(article.thumbnail)
else
  json.thumbnail_url nil
end
