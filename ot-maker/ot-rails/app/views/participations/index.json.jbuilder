json.array!(@participations) do |participation|
  json.extract! participation, :id, :user_id, :organization_id, :role
  json.url participation_url(participation, format: :json)
end
