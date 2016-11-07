class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :create
      # render json: {status: "true"}
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
      # render json: {status: "false"}
    end
  end

  def show
    @user = User.find_by(phone: normalize_phone_number(params[:phone]))
    if @user
      render json: @user, status: :ok
    else
      render json: { errors: 'Error!' }, status: :unprocessable_entity
    end
  end

 private

 def normalize_phone_number(phone_num)
  phone_num.gsub(/[^\d]/,'')
 end

 def user_params
   params.require(:user).permit(:phone, :username)
 end

end
