class ConversationController < ApplicationController

  def create
    @user_1 = User.find_by(username: params[:userone])
    @user_2 = User.find_by(phone: params[:phone])
    @conversation = Conversation.new(channel_url: params[:channel_url])
    @conversation.users = [@user_1, @user_2]
    if @conversation.save
      render json: {status: => "true"}
    else
      render json: {status: => "false"}
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:userone, :phone, :channel_url, :sentiment)
  end

end
