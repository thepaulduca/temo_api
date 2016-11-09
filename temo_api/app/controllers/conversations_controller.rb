class ConversationsController < ApplicationController

  def create

    puts '*' * 100
    puts 'params - conversation - userID'
    puts params['conversation']['userId']
    @user_1 = User.find_by(phone: params['conversation']['channel_url']['operators'][0]['userId'])
    puts @user_1
    @user_2 = User.find_by(phone: normalized_phone_number(params[:user_two]))
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



# {"channel_url"=>
#   {"channelType"=>"open", "participantCount"=>0, "operators"=> [{"nickname"=>"Guest_VVNWKW", "profileUrl"=>"https://sendbird.com/main/img/profiles/profile_32_512px.png", "userId"=>"218460156330197502352", "lastSeenAt"=>0, "connectionStatus"=>"nonavailable"}],
#     "url"=>"sendbird_open_channel_10291_812a8e60a422a5fe9153f2a42e7ed4ccbcad4366", "name"=>"rand", "coverUrl"=>"https://sendbird.com/main/img/cover/cover_01.jpg", "createdAt"=>1478716159000, "data"=>""},
#
#    "user_one"=>"Guest_VVNWKW", "user_two"=>"(555) 564-8583",
#    params['conversation']['channel_url']['operators'][0]['userId']
#     "conversation"=>{"channel_url"=>
#       {"channelType"=>"open", "participantCount"=>0,
#         "operators"=>[{"nickname"=>"Guest_VVNWKW", "profileUrl"=>"https://sendbird.com/main/img/profiles/profile_32_512px.png", "userId"=>"218460156330197502352", "lastSeenAt"=>0, "connectionStatus"=>"nonavailable"}],
#         "url"=>"sendbird_open_channel_10291_812a8e60a422a5fe9153f2a42e7ed4ccbcad4366", "name"=>"rand", "coverUrl"=>"https://sendbird.com/main/img/cover/cover_01.jpg", "createdAt"=>1478716159000, "data"=>""}}}
