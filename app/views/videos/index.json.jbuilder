json.videos @videos['response'] do |video|
  json.video do
  	json.id video['_id']
  	json.active video['active']
  	json.description video['description']
  	json.categories video['categories']
  	json.title video['title']
  	json.thumbnails video['thumbnails']
  	json.youtube_id video['youtube_id']
  end
end
