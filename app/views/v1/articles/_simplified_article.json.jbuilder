json.call(article, :id, :content, :title, :language, :type, :uploaded_at, :titlevideo, :description)

if article.video.attached?
  json.video_url rails_blob_url(article.video, only_path: false)
else
  json.video_url nil
end

if article.poster.attached?
  json.poster_url rails_blob_url(article.poster, only_path: false)
else
  json.poster_url nil
end

if article.thumbnail.attached?
  json.thumbnail_url rails_blob_url(article.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end
