class ConversationsController < ApplicationController

  def create
    if @user_1 = User.find_by(phone: params['conversation']['channel_url']['operators'][0]['userId'])
      @user_2 = User.find_by(phone: normalized_phone_number(params[:user_two]))
      @conversation = Conversation.new(channel_url: params[:channel_url][:url], users: [@user_1, @user_2])
      if @conversation.save
        render json: {worked: @conversation}
      else
        render json: {worked: "false"}
      end
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
