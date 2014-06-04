json.(@video, :id, :slug, :title, :client)
json.mp4 @video.mp4
json.ogg @video.ogg
json.poster @video.thumb(:poster)
