class LoginController < ApplicationController
  def new
  end

  def create
    user = validate params[:login][:password], params[:login][:username]
    if user
      respond_to do |format|
        format.html { redirect_to home_index_path, :notice => 'logged in successfully' }
      end
    else
      redirect_to login_new_path, :notice => 'log in not successful'
    end
  end

  def validate(password, username)
    User.find_by_password_and_username(password, username)
  end
end
