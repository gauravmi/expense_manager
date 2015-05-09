class LoginController < ApplicationController
  def new
  end

  def create
    user = validate params[:login][:password], params[:login][:username]
    if user
      session[:id] = user.id
      respond_to do |format|
        format.html {redirect_to home_index_path, :notice=>'logged in successfully'}
      end
    else
      render 'new'
    end
  end
  def validate(password, username)
    p password
    p username
    User.find_by_password_and_username(password, username)
  end
end
