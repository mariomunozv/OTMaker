json.array!(@work_orders) do |work_order|
  json.extract! work_order, :id, :code, :title, :description, :user_id, :organization_id, :bill_order_id
  json.url work_order_url(work_order, format: :json)
end
