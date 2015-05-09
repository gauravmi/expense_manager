class LoginController < ApplicationController
  def new
  end

  def create
    user = validate params[:password],params[:username]
    if user
      session[:id] = user.id
    end
  end

  def validate(password, username)
    User.find_by_password_and_username(password, username)
  end
end
