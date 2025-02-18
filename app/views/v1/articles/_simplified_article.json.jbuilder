json.call(article, :id, :content, :title, :language, :type, :uploaded_at)

if article.thumbnail.attached?
  json.thumbnail_url rails_blob_url(article.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end
