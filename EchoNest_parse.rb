require 'open-uri'
require 'json'
require './api_key'

artist_1 = "red hot chili peppers".gsub(/\s+/, "")
artist_2 = "daftpunk"
# puts artist_1
list = %w[artist songs catalog playlist]

result_num = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]

search_criteria = %w[search upload news terms hotttnesss id similar list status static biographies blogs]
# ARTIST
  # -Biographies
    bio = JSON.parse(open("http://developer.echonest.com/api/v4/artist/biographies?api_key=#{ECHO_API}&name=radiohead").read)["response"]["biographies"]
  # -Blogs
    blog = JSON.parse(open("http://developer.echonest.com/api/v4/artist/blogs?api_key=#{ECHO_API}&name=radiohead").read)
  # -News
    news = JSON.parse(open("http://developer.echonest.com/api/v4/artist/news?api_key=#{ECHO_API}&name=radiohead").read)
  # -Reviews
    reviews = JSON.parse(open("http://developer.echonest.com/api/v4/artist/reviews?api_key=#{ECHO_API}&name=radiohead").read)
  # -Song Hotttnesss
    hot = JSON.parse(open("http://developer.echonest.com/api/v4/artist/songs?api_key=#{ECHO_API}&name=radiohead").read)
  # -Suggest
    suggest = JSON.parse(open("http://developer.echonest.com/api/v4/artist/suggest?api_key=#{ECHO_API}&name=rad").read)
  # -Twitter(return twitter handle)
    twitter = JSON.parse(open("http://developer.echonest.com/api/v4/artist/twitter?api_key=#{ECHO_API}&name=radiohead").read)
  # -Urls to Offical site
    url = JSON.parse(open("http://developer.echonest.com/api/v4/artist/urls?api_key=#{ECHO_API}&name=radiohead").read)

# SONG
  # -Search
    JSON.parse(open("http://developer.echonest.com/api/v4/song/search?api_key=#{ECHO_API}&artist=radiohead&title=karma%20police").read)

result = JSON.parse(open("http://developer.echonest.com/api/v4/artist/news?api_key=#{ECHO_API}&name=redhotchilipeppers&results=10&start=0").read)
result = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=#{ECHO_API}&name=#{artist_1}&results=#{result_num[6]}&start=0").read)
puts result
puts
# result = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=ECHO_API&name=#{artist_2}").read)
# puts result
# puts result["response"]["news"].first.keys#.map {|artists| print artists["news"]}
puts result["response"]["news"].map {|term| puts term["date_found"], term["url"], term["name"], term["summary"] }
# news = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[1]}/#{search_criteria[1]}?api_key=ECHO_API&name=#{artist_1}&results=#{result_num[2]}&start=0").read)
puts
puts bio
puts
puts blog
puts
puts news
puts
puts reviews
puts
puts hot
puts
puts suggest
puts
puts twitter
puts
puts url



# curl -i 'http://developer.echonest.com/api/v4/artist/profile?api_key=ECHO_API&name=weezer'


# "http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=ECHO_API&name=#{artist_2}"







































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




