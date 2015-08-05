json.array!(@works) do |work|
  json.extract! work, :id, :desc, :horas, :fecha, :equipment_id, :worker_id
  json.url work_url(work, format: :json)
end
