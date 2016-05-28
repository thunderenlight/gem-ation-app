# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@ebevents = Unirest.get("https://www.eventbriteapi.com/v3/categories?&short_name&token=FHO43SJ3VXJC6S3P2TRR").body['categories'].each { |e| puts e.values[2] }
# Eventbrite = GET /categories/¶

# Chiketto::Category.list

categories['categories'].map { |cat| Chiketto::Category.new cat }
{"resource_uri"=>"https://www.eventbriteapi.com/v3/categories/103/", "id"=>"103", 
"name"=>"Music", "name_localized"=>"Music", "short_name"=>"Music", "short_name_localized"=>"Music"}, 
{"resource_uri"=>"https://www.eventbriteapi.com/v3/categories/101/", "id"=>"101", "name"=>"Business & Professional", 
"name_localized"=>"Business & Professional", "short_name"=>"Business", "short_name_localized"=>"Business"}

event = Chiketto::Event.find '22592779612'
@events = Eventbrite::Event.search({q: 'dinosaurs'}, 'FHO43SJ3VXJC6S3P2TRR').events[0..3]
# Next task is to seed my model 