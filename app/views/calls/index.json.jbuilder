json.array!(@calls) do |call|
  json.extract! call, :dpto_id, :servant_id, :technical_id, :equipment, :problem, :service, :obs, :closed
  json.url call_url(call, format: :json)
end
