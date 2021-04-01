class RestaurantsController < ApplicationController

    def index
    end

    def new
        @restaurant = Restaurant.new
    end

    def create

        # render html: "title is #{params[:title]}"
        redirect_to '/restaurants'
    end


end