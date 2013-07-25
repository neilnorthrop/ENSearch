require 'open-uri'
require 'json'

class ENSearchUrlError < Exception; end

class ENApiFetch
  attr_accessor :submit_response

  def initialize(query)
    @submit_response = JSON.parse(open("http://developer.echonest.com/api/v4/artist/news?api_key=ECHO_API&name=#{query}&results=10&start=0").read)
  end

  def xmlconvert(json_parse)
    xml = result.read
  end
end

class XMLParse
  attr_accessor :url, :date_found

  def initialize(xml)
    @url = xml["response"]["news"].map { |term| term["url"]}
    @date_found = xml["response"]["news"].map { |term| term["date_found"]}
  end
end

class ENSearchApi
  def initialize
  end
end