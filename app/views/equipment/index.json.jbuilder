json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :nombre, :codigo, :ssystem_id
  json.url equipment_url(equipment, format: :json)
end
