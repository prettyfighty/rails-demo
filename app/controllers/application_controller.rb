class ApplicationController < ActionController::Base
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  helper_method :current_user, :user_signed_in?

  private
  def record_not_found
    render plain: "查無資料", status: 404
  end

  def current_user
    User.find_by(id: session[ENV['session_name']])
  end

  def user_signed_in?
		session[ENV['session_name']]
	end

	def check_user!
		redirect_to root_path if not user_signed_in?
	end

end
