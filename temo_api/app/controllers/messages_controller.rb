class MessageController < ApplicationController

  def create
    @message = Message.new(user: params[:user_id], message: params[:message], sentiment: params[:sentiment])
    if @message.save
      @response = true
    else
      @response = false
    end
    render json: {response: @response}
  end

end
