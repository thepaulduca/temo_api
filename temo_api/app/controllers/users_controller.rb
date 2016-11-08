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
      normalized_phone_number(phone_number(contact)))
      User.find_by(phone: normalize_phone_number(get_phone_number(contact)))
    end
    render json: @contact_array, status: :ok
  end


 private

 def phone_number(contact)
   puts "Below is a contact in the phone number method"
   puts contact
  contact[phoneNumbers][0][number]
 end

 def normalized_phone_number(phone_number)
  puts 'below is a phone number within the normalized_phone_number'
  phone_number.gsub(/[^\d]/,'')
 end

 def user_params
   params.require(:user).permit(:phone, :username)
 end

end
