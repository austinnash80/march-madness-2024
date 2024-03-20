json.extract! game, :id, :status, :p1, :p1_score, :p2, :p2_score, :p3, :p3_score, :p4, :p4_score, :created_at, :updated_at
json.url game_url(game, format: :json)
