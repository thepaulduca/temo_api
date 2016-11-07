class ConversationController < ApplicationController

  def create
    @conversation = Conversation.new(users: params[:users], sentiment: params[:sentiment])
  end
end
