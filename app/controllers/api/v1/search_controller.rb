module Api
    module V1
      class SearchController < ApplicationController
        require 'httparty'
  
        def index
          query = params[:query]
          response = HTTParty.get("https://api.seatgeek.com/2/events?performers.slug=#{query}")
          render json: response.parsed_response
        end
      end
    end
  end