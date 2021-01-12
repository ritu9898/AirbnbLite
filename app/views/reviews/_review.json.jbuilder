json.extract! review, :id, :comment, :user_id, :property_id, :created_at, :updated_at
json.url review_url(review, format: :json)
