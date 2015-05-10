json.array!(@bill_orders) do |bill_order|
  json.extract! bill_order, :id, :folio, :issued, :status
  json.url bill_order_url(bill_order, format: :json)
end
