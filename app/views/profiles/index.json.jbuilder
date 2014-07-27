json.array!(@profiles) do |profile|
  json.extract! profile, :id, :bay_films_watched, :megan_foxs_acting_ability
  json.url profile_url(profile, format: :json)
end
