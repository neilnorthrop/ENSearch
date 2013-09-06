class SearchController < ApplicationController
  attr_accessor :submit_fetch, :result_fetch

  def search
    if params[:artist]
      begin
        gon.submit_fetch = ENAPIFetch.artist_search(params[:en_search_field])["response"]["biographies"]
      rescue ENSearchUrlError => e
        redirect_to :root, :flash => { :error => 'Invalid URL' }
      end
    elsif params[:song]
      begin
        gon.submit_fetch = ENAPIFetch.song_search(params[:en_search_field])["response"]["songs"]
      rescue ENSearchUrlError => e
        redirect_to :root, :flash => { :error => 'Invalid URL' }
      end
    end
  end
end
