class SearchController < ApplicationController
  attr_accessor :submit_fetch, :result_fetch

  def search
    if params[:artist]
      logger.info "******************************************************************"
      logger.info "\tHERE IS THE TERM SEARCHED FOR: #{params[:artist]}"
      logger.info "******************************************************************"
      logger.info "\tHERE IS WHAT WAS SEARCHED FOR: #{params[:en_search_field]}"
      logger.info "******************************************************************"
      begin
        gon.submit_fetch = ENAPIFetch.artist_search(params[:en_search_field])["response"]["biographies"]
        logger.info "#{submit_fetch}"
        logger.info "#{gon.submit_fetch}"
      rescue ENSearchUrlError => e
        redirect_to :root, :flash => { :error => 'Invalid URL' }
      end
    elsif params[:song]
      logger.info "******************************************************************"
      logger.info "\tHERE IS THE TERM SEARCHED FOR: #{params[:song]}"
      logger.info "******************************************************************"
      logger.info "\tHERE IS WHAT WAS SEARCHED FOR: #{params[:en_search_field]}"
      logger.info "******************************************************************"
      begin
        gon.submit_fetch = ENAPIFetch.song_search(params[:en_search_field])["response"]["songs"]
      rescue ENSearchUrlError => e
        redirect_to :root, :flash => { :error => 'Invalid URL' }
      end
    end
  end
end
