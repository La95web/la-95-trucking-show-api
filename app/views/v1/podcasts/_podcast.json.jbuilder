json.call(podcast, :id, :title, :language, :video_url, :uploaded_at, :created_at, :updated_at)

if podcast.thumbnail.attached?
  json.thumbnail rails_blob_url(podcast.thumbnail, only_path: false)
else
  json.thumbnail nil
end
