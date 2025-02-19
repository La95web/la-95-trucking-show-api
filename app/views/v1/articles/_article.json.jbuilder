json.call(article, :id, :title, :language, :content, :type, :uploaded_at, :created_at, :updated_at)

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
