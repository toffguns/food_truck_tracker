json.array!(@owners) do |owner|
  json.extract! owner, :id
  json.url owner_url(owner, format: :json)
end
