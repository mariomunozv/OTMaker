json.array!(@changes) do |change|
  json.extract! change, :id, :work_order_id, :user_id, :code, :title, :description, :bill_order_id
  json.url change_url(change, format: :json)
end
