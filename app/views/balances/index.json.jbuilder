json.array!(@balances) do |balance|
  json.extract! balance, :id, :article_id
  json.url balance_url(balance, format: :json)
end
