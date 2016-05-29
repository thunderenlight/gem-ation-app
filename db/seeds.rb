# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# There are three gems in the folling examples, unirest does the direct url get. Its clearer as it can read in the path. Searching events by attributes and 
# not just by keyword as seen in the Eventbrite.search gem/wrapper. Additionally the third Chicketto search returns error.
# there is some benifit to the wrappers though like accessing key val faster. 

me = Unirest.get("https://www.eventbriteapi.com/v3/events/search/?venue.city=chicago&token=FHO43SJ3VXJC6S3P2TRR")
be = Unirest.get("https://www.eventbriteapi.com/v3/events/search/?category=103&token=FHO43SJ3VXJC6S3P2TRR").body.first
me.body.values.last.first.keys
=> ["name", "description", "id", "url", "start", "end", "created", "changed", "capacity", "status", "currency", "listed", "shareable", "online_event", "tx_time_limit", "hide_start_date", "locale", "is_locked", "privacy_setting", "is_series", "is_series_parent", "is_reserved_seating", "logo_id", "organizer_id", "venue_id", "category_id", "subcategory_id", "format_id", "resource_uri", "logo"]
chievents = Unirest.get("https://www.eventbriteapi.com/v3/events/search/?venue.city=chicago&token=FHO43SJ3VXJC6S3P2TRR")
user = Unirest.get("https://www.eventbriteapi.com/v3/users/me/?token=MQMS5IMXSWXDX2PTTCHX")



# Chiketto::Category.list

categories['categories'].map { |cat| Chiketto::Category.new cat }
{"resource_uri"=>"https://www.eventbriteapi.com/v3/categories/103/", "id"=>"103", 
"name"=>"Music", "name_localized"=>"Music", "short_name"=>"Music", "short_name_localized"=>"Music"}, 
{"resource_uri"=>"https://www.eventbriteapi.com/v3/categories/101/", "id"=>"101", "name"=>"Business & Professional", 
"name_localized"=>"Business & Professional", "short_name"=>"Business", "short_name_localized"=>"Business"}

kevent = Chiketto::Event.find '22592779612'#this find works



devents = Eventbrite::Event.search({q: '22592779612'}, 'FHO43SJ3VXJC6S3P2TRR').events[0..3]
# Next task is to seed my event model 
