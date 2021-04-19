class RestaurantsController < ApplicationController

	before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@q = Restaurant.available.ransack(params[:q])
  	@restaurants = @q.result(distinct: true)
	end

	def new
		if session[:thankyou9527]
			@restaurant = Restaurant.new
		else
			redirect_to restaurants_path
		end
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to restaurants_path, notice: "新增餐廳成功"
		else
			render :new
		end
		# render html: "title is #{params[:title]}"
	end

	def show
	end

	def edit
	end

	def update
		if @restaurant.update(restaurant_params)
			redirect_to restaurants_path, notice: "編輯餐廳成功"
		else
			render :edit
		end
	end

	def destroy
		@restaurant.destroy
		redirect_to restaurants_path, notice: "刪除餐廳成功"
	end

	private
		def find_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

	def restaurant_params
		params.require(:restaurant).permit(:title, :address, :tel, :email, :description)
	end

end