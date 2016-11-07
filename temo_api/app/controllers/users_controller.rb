class UsersController < ApplicationController

  def create
    @user = User.new(username: param[:username], phone: params[:phone])
    if @user.save
      @response = true
    else
      @response = false
    end
    return json: {response: @response}
  end

  def show
    @user = User.find_by(phone: params[:phone])
    return json: {user: @user}
  end

end
