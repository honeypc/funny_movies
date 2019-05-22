json.extract! movie, :id, :name, :description, :url, :thumbnails, :play_list_id, :owner_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
