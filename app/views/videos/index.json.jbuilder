json.videos @videos['response'] do |video|
  json.id video['_id']
  json.active video['active']
  json.description video['description']
  json.categories video['categories']
  json.title video['title']
  json.thumbnail video['thumbnails'].first
  json.youtube_id video['youtube_id']
  json.subscription_required video['subscription_required']
end

json.pagination @videos['pagination']
