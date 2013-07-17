require 'open-uri'
require 'json'

artist_1 = "red hot chili peppers".gsub(/\s+/, "")
artist_2 = "daftpunk"
# puts artist_1
list = %w[artist songs catalog playlist]

result_num = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]

search_criteria = %w[search upload news terms hotttnesss id similar list status static biographies blogs]

result = JSON.parse(open("http://developer.echonest.com/api/v4/artist/news?api_key=XAUYNWAOCHDKBEGYI&name=redhotchilipeppers&results=10&start=0").read)
result = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_1}&results=#{result_num[6]}&start=0").read)
puts result
puts
# result = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_2}").read)
# puts result
# puts result["response"]["news"].first.keys#.map {|artists| print artists["news"]}
puts result["response"]["news"].map {|term| puts term["date_found"], term["url"], term["name"], term["summary"] }
# news = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[1]}/#{search_criteria[1]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_1}&results=#{result_num[2]}&start=0").read)




# curl -i 'http://developer.echonest.com/api/v4/artist/profile?api_key=XAUYNWAOCHDKBEGYI&name=weezer'


# "http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_2}"







































# { artist =>
#   biographies,
#   blogs,
#   familiarity,
#   hotttnesss,
#   images,
#   list_genres,
#   list_terms,
#   news,
#   profile,
#   reviews,
#   search,
#   extract,
#   songs,
#   similar,
#   suggest,
#   terms,
#   top_hottt,
#   top_terms,
#   twitter,
#   urls,
#   video
#   song =>
#   search,
#   profile,
#   identify
#   track =>
#   profile,
#   upload
#   playlist =>
#   basic,
#   static,
#   dynamic/create,
#   dynamic/restart,
#   dynamic/next,
#   dynamic/feedback,
#   dynamic/steer,
#   dynamic/info,
#   dynamic/delete,
#   taste =>
#   create,
#   update,
#   keyvalues,
#   play,
#   skip,
#   favorite,
#   ban,
#   rate,
#   status,
#   profile,
#   read,
#   feed,
#   delete,
#   list,
#   similar,
#   predict
# }


# For reading XML
# require 'open-uri'
# require 'nokogiri'

# result = Nokogiri.XML(open("url_of_xml_service").read)




