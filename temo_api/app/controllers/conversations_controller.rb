class ConversationsController < ApplicationController

  def create
    user_one = params[:user_one]
    user_one_augment = get_username(user_one)
    puts "*" * 30
    puts "i'm the params"
    puts params
    puts "*" * 30
    puts ''
    puts "*" * 30
    puts "I'm the user one argument"
    puts user_one_augment
    puts "*" * 30
    @user_1 = User.find_by(username: user_one_augment)
    @user_2 = User.find_by(phone: params[:user_two])
    @conversation = Conversation.new(channel_url: params[:channel_url][:url])
    @conversation.users = [@user_1, @user_2]
    if @conversation.save
      render json: {worked: "true"}
    else
      render json: {worked: "false"}
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:userone, :phone, :channel_url, :sentiment)
  end

  def get_username(guest_username)
    guest_username.slice!(6 ..-1)
  end

end
