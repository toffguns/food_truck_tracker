json.array!(@contributors) do |contributor|
  json.extract! contributor, :id
  json.url contributor_url(contributor, format: :json)
end
