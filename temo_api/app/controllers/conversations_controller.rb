class ConversationsController < ApplicationController

  def create
    user_one = params[:user_one]
    user_one_augment = get_username(user_one)
    @user_1 = User.find_by(username: 'paul')
    puts '*' * 100
    puts 'I AM USER ONE'
    puts @user_1
    @user_2 = User.find_by(phone: normalized_phone_number(params[:user_two]))
    puts '*' * 100
    puts 'I AM USER Two'
    puts @user_2
    @conversation = Conversation.new(channel_url: params[:channel_url][:url])
    puts '*' * 100
    puts 'I AM CONVERSATION'
    puts @conversation
    @conversation.users = [@user_1, @user_2]
    if @conversation.save
      render json: {worked: "true"}
    else
      render json: {worked: "false"}
    end
  end

  private

  def normalized_phone_number(phone_number)
   phone_number.gsub(/[^\d]/,'')
  end

  def conversation_params
    params.require(:conversation).permit(:userone, :phone, :channel_url, :sentiment)
  end

  def get_username(guest_username)
    guest_username.slice!(6 ..-1)
  end

end
