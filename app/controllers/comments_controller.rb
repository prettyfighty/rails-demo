class CommentsController < ApplicationController

  before_action :check_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.new(comment_params)
    # @comment.user = current_user

    if @comment.save
      # redirect_to restaurant_path(@restaurant)
    else
      render restaurant_path(@restaurant)
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge({user: current_user})

    # permitted_params = params.require(:comment).permit(:content)
    # permitted_params[:user] = current_user
    # return permitted_params
  end


  
end
