json.array!(@inputs) do |input|
  json.extract! input, :id, :cantidad, :article_id
  json.url input_url(input, format: :json)
end
