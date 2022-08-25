json.array! @departures do |d|
  json.id d.id
  json.door d.door
  json.truck d.truck
  json.route d.route
  json.loader d.loader
  json.driver d.driver
  json.loaded d.loaded
  json.loaded_time display_date(d.loaded_time)
  json.confirmed d.confirmed
  json.confirmed_time display_date(d.confirmed_time)
end
