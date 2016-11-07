class UsersController < ApplicationController

  def new
    puts "====================================================================="
    puts "Hello ya'll"
    puts "====================================================================="
    render json: {'response' => 'hit the server'}, status: :ok
  end

  def create
    @user = User.new(username: param[:username], phone: params[:phone])
    if @user.save
      @response = true
    else
      @response = false
    end
    return json: {'response' => @response}
  end

  def show
    @user = User.find_by(phone: params[:phone])
    return json: {user: @user}
  end

end
