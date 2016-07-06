json.array!(@trucks) do |truck|
  json.extract! truck, :id, :name, :cuisine, :menu
  json.url truck_url(truck, format: :json)
end
