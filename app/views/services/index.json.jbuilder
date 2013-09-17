json.array!(@services) do |service|
  json.extract! service, :service, :priority
  json.url service_url(service, format: :json)
end
