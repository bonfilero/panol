json.array!(@systems) do |system|
  json.extract! system, :id, :nombre
  json.url system_url(system, format: :json)
end
