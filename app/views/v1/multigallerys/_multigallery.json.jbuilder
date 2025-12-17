json.extract! multigallery, :id, :uploaded_at, :created_at, :updated_at

# Videos (array)
json.videos multigallery.video.map { |file|
  rails_blob_url(file, only_path: false)
}

# Poster (una sola imagen)
json.poster rails_blob_url(multigallery.poster, only_path: false) if multigallery.poster.attached?

# Thumbnails (array)
json.thumbnails multigallery.thumbnail.map { |file|
  rails_blob_url(file, only_path: false)
}

# Gallery (array)
json.gallery multigallery.gallery.map { |file|
  rails_blob_url(file, only_path: false)
}
