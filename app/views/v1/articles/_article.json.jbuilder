json.call(article, :id, :title, :language, :content, :type, :uploaded_at, :created_at, :updated_at, :titlevideo, :description)

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

if article.main_image.attached?
  json.main_image_url rails_blob_url(article.main_image, only_path: false)
else
  json.main_image_url nil
end

if article.thumbnail.attached?
  json.thumbnail_url rails_blob_url(article.thumbnail, only_path: false)
else
  json.thumbnail_url nil
end


json.sections article.sections do |section|
  json.partial! "v1/sections/section", section: section
end
