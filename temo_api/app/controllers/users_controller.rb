class UsersController < ApplicationController
  def create
    puts "====================================================================="
    puts "CREATE"
    puts "====================================================================="
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :create
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def show
    puts "====================================================================="
    puts "SHOW"
    puts "====================================================================="
    @user = User.find_by(phone: params[:phone])
    if @user
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

 private

 def user_params
   params.require(:user).permit(:phone, :username)
 end

end
