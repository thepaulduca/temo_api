class UsersController < ApplicationController
  def new
    puts "====================================================================="
    puts "NEW"
    puts "====================================================================="
    render json: {'response' => 'hit the server'}, status: :ok
  end

  def create
    puts "====================================================================="
    puts "CREATE"
    puts "====================================================================="
    @user = User.new(username: param[:username], phone: params[:phone])
    if @user.save
      render json: @user, status: :create
    else
      render json: {'response' => 'you got an error'}
    end
  end

  def show
    puts "====================================================================="
    puts "SHOW"
    puts "====================================================================="
    @user = User.find_by(phone: params[:phone])
    render json: @user
  end
end
