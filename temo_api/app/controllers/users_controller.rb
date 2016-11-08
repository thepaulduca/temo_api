class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :create
      # render json: {status: "true"}
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
      # render json: {status: "false"}
    end
  end

  def show
    @contacts = params[:contacts]
    @contact_array = @contacts.select {|contact| User.find_by(phone: normalize_phone_number(get_phone_number(contact))) }
    render json: @contact_array, status: :ok
  end

  # def show
  #   @user = User.find_by(phone: normalize_phone_number(params[:phone]))
  #   if @user
  #     render json: @user, status: :ok
  #   else
  #     render json: { errors: 'Error!' }, status: :unprocessable_entity
  #   end
  # end


  {"contacts"=>
    [{"givenName"=>"John",
      "thumbnailPath"=>"",
      "phoneNumbers"=>[{"number"=>"888-555-5512", "label"=>"mobile"}, {"number"=>"888-555-1212", "label"=>"home"}],
      "familyName"=>"Appleseed",
      "emailAddresses"=>[{"email"=>"John-Appleseed@mac.com", "label"=>"work"}],
      "recordID"=>3},

      {"givenName"=>"Kate",
        "thumbnailPath"=>"",
        "phoneNumbers"=>[{"number"=>"(555) 564-8583", "label"=>"mobile"}, {"number"=>"(415) 555-3695", "label"=>"main"}],
        "familyName"=>"Bell",
        "emailAddresses"=>[{"email"=>"kate-bell@mac.com", "label"=>"work"}, {"email"=>"www.icloud.com", "label"=>"work"}],
        "recordID"=>1},

        {"givenName"=>"Anna",
          "thumbnailPath"=>"",
          "phoneNumbers"=>[{"number"=>"555-522-8243", "label"=>"home"}],
          "familyName"=>"Haro",
          "emailAddresses"=>[{"email"=>"anna-haro@mac.com", "label"=>"home"}], "recordID"=>4},


          {"givenName"=>"Daniel",
            "thumbnailPath"=>"",
            "phoneNumbers"=>[{"number"=>"555-478-7672", "label"=>"home"}, {"number"=>"(408) 555-5270", "label"=>"mobile"}, {"number"=>"(408) 555-3514", "label"=>"home fax"}],
            "familyName"=>"Higgins", "emailAddresses"=>[{"email"=>"d-higgins@mac.com", "label"=>"home"}], "recordID"=>2},

            {"givenName"=>"David", "thumbnailPath"=>"",
              "phoneNumbers"=>[{"number"=>"555-610-6679", "label"=>"home"}],
            "familyName"=>"Taylor",
            "emailAddresses"=>[], "recordID"=>6}, {"emailAddresses"=>[{"email"=>"hank-zakroff@mac.com", "label"=>"work"}],


            "middleName"=>"M.", "familyName"=>"Zakroff", "givenName"=>"Hank", "thumbnailPath"=>"",
            "phoneNumbers"=>[{"number"=>"(555) 766-4823", "label"=>"work"}, {"number"=>"(707) 555-1854", "label"=>"other"}], "recordID"=>5}],



            "user"=>{}}




 private

 def get_phone_number(contact)
  contact[phoneNumbers[0][number]]
 end

 def normalize_phone_number(phone_num)
  phone_num.gsub(/[^\d]/,'')
 end

 def user_params
   params.require(:user).permit(:phone, :username, :users)
 end

end
