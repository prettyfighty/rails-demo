class RestaurantsController < ApplicationController

	before_action :find_restaurant, only: [:edit, :update, :destroy]
	before_action :check_user!, except: [:index, :show]

	def index
		@q = Restaurant.available.includes(:user).ransack(params[:q])
  	@restaurants = @q.result(distinct: true)
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		# @restaurant = Restaurant.new(restaurant_params)
		
		# @restaurant.user_id = current_user.id
		# @restaurant.user = current_user

		@restaurant = current_user.restaurants.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_path, notice: "新增餐廳成功"
		else
			render :new
		end
		# render html: "title is #{params[:title]}"
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@comment = @restaurant.comments.new
		@comments = @restaurant.comments.order(id: :desc).includes(:user)
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
		# @restaurant = Restaurant.find(params[:id])
		@restaurant = current_user.restaurants.find(params[:id])
	end

	def restaurant_params
		params.require(:restaurant).permit(:title, :address, :tel, :email, :description)
	end

end