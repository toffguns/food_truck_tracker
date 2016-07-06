json.array!(@time_and_places) do |time_and_place|
  json.extract! time_and_place, :id, :start_time, :end_time, :street_address, :city, :state, :zip_code
  json.url time_and_place_url(time_and_place, format: :json)
end
