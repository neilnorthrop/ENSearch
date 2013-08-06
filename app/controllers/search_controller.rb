class SearchController < ApplicationController
  attr_accessor :submit_parse_fetch

  def search
    begin
      @result_fetch = ENApiFetch.new(params[:en_search_field]).submit_response
      @submit_parse_fetch = JSONParse.new(@result_fetch).url[0]
      gon.submit_fetch = @submit_parse_fetch
    rescue ENSearchUrlError => e
      redirect_to :root, :flash => { :error => 'Invalid URL' }
    end
  end
end
