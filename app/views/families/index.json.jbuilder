json.array!(@families) do |family|
  json.extract! family, :id, :nombre, :desc
  json.url family_url(family, format: :json)
end
