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
    @contacts = params[:contacts]
    @contact_array = @contacts.select do |contact|
      phone_number = normalized_phone_number(phone_number(contact))
      User.find_by(phone: phone_number)
    end
    render json: @contact_array, status: :ok
  end

  def conversations
    @user = User.find_by(params[username: :username])
    render json: {conversations: @user.conversations}
  end


 private

 def phone_number(contact)
  contact["phoneNumbers"][0]["number"]
 end

 def normalized_phone_number(phone_number)
  phone_number.gsub(/[^\d]/,'')
 end

 def user_params
   params.require(:user).permit(:phone, :username)
 end

end
