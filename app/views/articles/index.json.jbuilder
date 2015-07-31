json.array!(@articles) do |article|
  json.extract! article, :id, :nombre, :desc, :saldo, :stockmin, :lotecompra, :unidad, :unidadcompra, :ucompraporudeuso, :sfamily_id, :family_id, :ssfamily_id
  json.url article_url(article, format: :json)
end
