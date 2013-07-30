class SearchController < ApplicationController
  attr_accessor :submit_parse_fetch

  def result
  end

  def search
    begin
      @submit_parse_fetch = ENApiFetch.new(params[:en_search_field]).submit_response
      @submit_parse_fetch = XMLParse.new(@submit_parse_fetch).url[0]
    rescue ENSearchUrlError => e
      redirect_to :root, :flash => { :error => 'Invalid URL' }
    end
  end
end
