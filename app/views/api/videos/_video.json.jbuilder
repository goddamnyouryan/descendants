json.(video, :id, :slug, :title, :client, :mp4, :ogg, :thumb, :agency, :next)
json.director video.director.name
json.poster video.thumb(:hero)
