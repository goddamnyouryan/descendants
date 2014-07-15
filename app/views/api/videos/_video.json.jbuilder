json.(video, :id, :slug, :title, :client, :mp4, :ogg, :thumb, :agency)
json.poster video.thumb(:poster)
