class SessionsController < ApplicationController
  def new
    #new session form
  end

  def create
    #login
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    #logout
    if logged_in?
      logout(current_user)
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
