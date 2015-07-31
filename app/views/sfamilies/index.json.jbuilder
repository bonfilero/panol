json.array!(@sfamilies) do |sfamily|
  json.extract! sfamily, :id, :nombre, :desc, :family_id
  json.url sfamily_url(sfamily, format: :json)
end
