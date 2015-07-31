json.array!(@workers) do |worker|
  json.extract! worker, :id, :id, :nombre
  json.url worker_url(worker, format: :json)
end
