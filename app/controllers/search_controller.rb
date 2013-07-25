class SearchController < ApplicationController
  attr_accessor :submit_parse_url, :submit_parse_date_found

  def result
  end

  def search
    begin
      @submit_query = params[:en_search_field][:artist_or_song]
      @submit_response = ENApiFetch.new(@submit_query).submit_response
      @submit_parse_url = XMLParse.new(@submit_response).url
      @submit_parse_date_found = XMLParse.new(@submit_response).date_found
      redirect_to :result
    rescue  ENSearchUrlError => e
      redirect_to :root, :flash => { :error => 'Invalid URL' }
    end
  end
end
