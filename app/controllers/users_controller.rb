class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save && UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Activation Code has been sent. Please check your email."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
  
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
  end
end
  
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end  
    
end
