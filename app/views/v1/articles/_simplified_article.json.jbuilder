json.call(article, :id, :title, :type, :uploaded_at)

if article.thumbnail.attached?
  json.thumbnail_url url_for(article.thumbnail)
else
  json.thumbnail_url nil
end
