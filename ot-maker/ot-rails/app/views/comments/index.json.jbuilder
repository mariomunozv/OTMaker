json.array!(@comments) do |comment|
  json.extract! comment, :id, :work_order_id, :user_id, :content
  json.url comment_url(comment, format: :json)
end
