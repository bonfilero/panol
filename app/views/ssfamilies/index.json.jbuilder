json.array!(@ssfamilies) do |ssfamily|
  json.extract! ssfamily, :id, :nombre, :desc, :sfamily_id
  json.url ssfamily_url(ssfamily, format: :json)
end
