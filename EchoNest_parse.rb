require 'open-uri'
require 'json'

artist_1 = "redhotchilipeppers"
artist_2 = "daftpunk"

list = %w[artist songs catalog playlist]

result_num = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]

search_criteria = %w[search news terms hotttnesss id similar list status static biographies blogs]

# result = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[1]}/#{search_criteria[0]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_2}&results=#{result_num[1]}&start=0").read)
result = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[0]}/#{search_criteria[2]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_2}").read)

# news = JSON.parse(open("http://developer.echonest.com/api/v4/#{list[1]}/#{search_criteria[1]}?api_key=XAUYNWAOCHDKBEGYI&name=#{artist_1}&results=#{result_num[2]}&start=0").read)


def method_for_iterating_over_terms(criteria)

  array_each_result = []

  criteria.each do |key, value|
    value.each do |key, value|
      if key == "terms"
        value.each do |hash_of_values|
          hash_of_values.each do |key, value|
            print "#{key} is #{value}"
            puts
          end
        end
      end
    end
  end
end


method_for_iterating_over_terms(result)
# puts news

# curl -i 'http://developer.echonest.com/api/v4/artist/profile?api_key=XAUYNWAOCHDKBEGYI&name=weezer'




































# For reading XML
# require 'open-uri'
# require 'nokogiri'

# result = Nokogiri.XML(open("url_of_xml_service").read)




