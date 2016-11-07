class ConversationController < ApplicationController

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      render json: {status: => "true"}
    else
      render json: {status: => "false"}
    end
  end

  private

  def conversation_params
    params.require(:user).permit(:users, :channel_url, :sentiment)
  end

end
