json.(video, :id, :slug, :title, :client, :mp4, :ogg, :thumb)
json.poster video.thumb(:poster)
