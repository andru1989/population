json.array!(@people) do |person|
  json.extract! person, :id, :name, :last_name, :identification_type, :identification, :address, :gender, :phone, :city_id
  json.url person_url(person, format: :json)
end
