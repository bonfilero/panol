json.array!(@outputs) do |output|
  json.extract! output, :id, :cantidad, :article_id
  json.url output_url(output, format: :json)
end
