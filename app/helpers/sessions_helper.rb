module SessionsHelper

  def user_signed_in?
    session[ENV['session_name']]
  end

  def current_user
    User.find_by(id: session[ENV['session_name']])
  end


end
