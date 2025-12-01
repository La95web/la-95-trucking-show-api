json.call(audio, :id, :title, :uploaded_at, :created_at)

if audio.main_audio.attached?
  json.main_audio_url rails_blob_url(audio.main_audio, only_path: false)
else
  json.main_audio_url nil
end
