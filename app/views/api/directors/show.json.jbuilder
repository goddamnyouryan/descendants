json.(@director, :id, :slug, :name)
json.featured do
  json.(@featured, :id, :slug, :title, :client)
  json.hero @featured.thumb(:hero)
end
json.videos @videos do |video|
  json.(video, :id, :slug, :title, :client)
  json.thumb video.thumb
end
