json.extract! multigallery, :id, :uploaded_at, :created_at, :updated_at

# Videos
json.videos multigallery.video.map { |file|
  rails_blob_url(file, only_path: false)
}

# Thumbnails
json.thumbnails multigallery.thumbnail.map { |file|
  rails_blob_url(file, only_path: false)
}

# Gallery
json.gallery multigallery.gallery.map { |file|
  rails_blob_url(file, only_path: false)
}
