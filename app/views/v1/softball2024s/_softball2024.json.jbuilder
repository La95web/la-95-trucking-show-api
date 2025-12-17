json.extract! softball2024, :id, :uploaded_at, :created_at, :updated_at

# Videos (array)
json.videos softball2024.video.map { |file|
  rails_blob_url(file, only_path: false)
}

# Poster (una sola imagen)
json.poster rails_blob_url(softball2024.poster, only_path: false) if softball2024.poster.attached?

# Thumbnails (array)
json.thumbnails softball2024.thumbnail.map { |file|
  rails_blob_url(file, only_path: false)
}

# Gallery (array)
json.gallery softball2024.gallery.map { |file|
  rails_blob_url(file, only_path: false)
}
