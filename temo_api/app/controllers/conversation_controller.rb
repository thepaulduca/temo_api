class ConversationController < ApplicationController

  def create
    puts '--------------------------------------------'
    puts 'params'
    puts params
    puts 'get user name - with get username method being called'
    puts get_username(params[:userone])
    puts 'user one instance'
    puts @user_1.inspect
    puts '--------------------------------------------'
    user_1 = User.find_by(username: get_username(params[:userone]))
    @user_2 = User.find_by(phone: params[:phone])
    @conversation = Conversation.new(channel_url: params[:channel_url])
    @conversation.users = [@user_1, @user_2]
    if @conversation.save
      render json: {status: "true"}
    else
      render json: {status: "false"}
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:userone, :phone, :channel_url, :sentiment)
  end

  def get_username(guest_username)
    guest_username.slice!(7..-1)
  end

end
