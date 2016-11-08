class MessageController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      @response = true
    else
      @response = false
    end
    render json: {response: @response}
  end

  def message_params
    params.require(:message).permit(:user_id, :message, :sentiment)
  end

end
