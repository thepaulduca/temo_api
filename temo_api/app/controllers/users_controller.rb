class UsersController < ApplicationController

  def login
    if @user = User.find_by(phone: params[:phone])
      render json: @user, status: :ok
    else
      render json: { errors: 'you bad' }, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :create
    else
      render json: { errors: 'you bad'}, status: :unprocessable_entity
    end
  end

  def show
    @contacts = params[:contacts]
    @contact_array = @contacts.select do |contact|
      if contact["phoneNumbers"]
        phone_number = normalized_phone_number(phone_number(contact))
        User.find_by(phone: phone_number)
      end
    end
    render json: @contact_array, status: :ok
  end

  def conversations
    if @user = User.find_by(phone: params[:phone])

      @conversations = @user.conversations.map do |convo|
        other_user = convo.users.select { |user| user.id != @user.id }
        [convo.channel_url, other_user]

      end

      render json: {user: @user, conversations: @conversations}
    else
      render json: {conversations: 'errors'}
    end
  end


 private

 def phone_number(contact)
  if contact["phoneNumbers"][0]["number"]
    return contact["phoneNumbers"][0]["number"]
  else
    return "0"
  end
 end

 def normalized_phone_number(phone_number)
  phone_number.gsub(/[^\d]/,'')
 end

 def user_params
   params.require(:user).permit(:phone, :username)
 end

end
