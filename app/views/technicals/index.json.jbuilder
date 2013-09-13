json.array!(@technicals) do |technical|
  json.extract! technical, :name, :nickname, :password, :password_digest
  json.url technical_url(technical, format: :json)
end
