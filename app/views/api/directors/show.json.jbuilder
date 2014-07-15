json.(@director, :id, :slug, :name)

json.featured do
  json.partial! 'api/videos/video', video: @featured
end

json.videos @videos do |video|
  json.partial! 'api/videos/video', video: video
end
