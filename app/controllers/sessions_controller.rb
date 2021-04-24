class SessionsController < ApplicationController


  def new
    @user = User.new
    cookies[:return_to_url] = request.referer
  end

  def create
    user = User.login(user_params)

    if user
      # gem install figaro
      session[ENV['session_name']] = user.id

      redirect_to cookies[:return_to_url] || root_path
      cookies[:return_to_url] = nil
    else
      redirect_to sign_in_sessions_path, notice: "您輸入的帳號或密碼錯誤"
    end
  end

  def destroy
    cookies[:return_to_url] = request.referer

    session[ENV['session_name']] = nil
    redirect_to cookies[:return_to_url] || root_path
    cookies[:return_to_url] = nil
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
