require 'open-uri'
require 'json'

class ENSearchUrlError < Exception; end

class ENApiFetch
  attr_accessor :submit_response

  def initialize(query)
    @search_query = query_constructor(query)
    @submit_response = JSON.parse(open(api_url_contructor(@search_query)).read)
  end

  def query_constructor(query)
    query.gsub(/\s+/, "")
  end

  def api_url_contructor(search_query)
    api_base_url + api_mid_url + search_input(search_query)
  end

  def search_input(search_query)
    "&name=#{search_query}"
  end

  def api_mid_url
    who + what + api_key
  end

  def api_key
    "api_key=#{ENV["ECHO_API"]}"
  end

  def what
    "news?"
  end

  def who
    "artist/"
  end

  def api_base_url
    "http://developer.echonest.com/api/v4/"
  end
end

class XMLParse
  attr_accessor :url, :date_found

  def initialize(xml)
    @url = []
    @url << xml["response"]["news"].map { |term| term }
    return @url
  end
end

class ENSearchApi
  def initialize
  end

  def submit(query)
    ENApiFetch.new(query).submit_response
  end

  def submit_parse_url(result)
    XMLParse.new(result).url
  end

  def submit_parse_date_found(result)
    XMLParse.new(result).date_found
  end

end



