json.array!(@notification_types) do |notification_type|
  json.extract! notification_type, :id, :name, :template
  json.url notification_type_url(notification_type, format: :json)
end
