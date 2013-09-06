class SearchController < ApplicationController
  attr_accessor :submit_parse_fetch, :result_fetch

  def search
    if params[:artist]
      begin
        gon.submit_fetch = ENAPIFetch.artist_search(params[:en_search_field])["response"]["biographies"]
        # @submit_parse_fetch = @result_fetch
        # gon.submit_fetch = @submit_parse_fetch
      rescue ENSearchUrlError => e
        redirect_to :root, :flash => { :error => 'Invalid URL' }
      end
    elsif params[:song]
      begin
        @result_fetch = ENApiFetch.new(params[:song]).submit_response
      rescue ENSearchUrlError => e
        redirect_to :root, :flash => { :error => 'Invalid URL' }
      end
    end
  end
end
