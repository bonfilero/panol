json.array!(@ssystems) do |ssystem|
  json.extract! ssystem, :id, :nombre, :system_id
  json.url ssystem_url(ssystem, format: :json)
end
