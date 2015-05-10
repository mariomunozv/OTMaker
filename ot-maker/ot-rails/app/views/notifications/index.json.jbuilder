json.array!(@notifications) do |notification|
  json.extract! notification, :id, :user_id, :work_order_id, :detail, :status, :notification_type_id
  json.url notification_url(notification, format: :json)
end
