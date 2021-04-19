class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    user = User.login(user_params)
    if user
      session[ENV['session_name']] = user.id

      # gem install figaro
      redirect_to root_path
    else
      redirect_to sign_in_sessions_path, notice: "您輸入的帳號或密碼錯誤"
    end
  end

  def destroy
    session[ENV['session_name']] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
