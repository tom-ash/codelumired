module UsersShow
  def phone
    @user = Announcement.find(params[:id]).user
    @user_cipher = UserCipher.find(@user.id)
    decrypt_phone_body
    render json: {
      phone: "#{@user.phone['phone_code']} #{@phone_body[0..2]} #{@phone_body[3..5]} #{@phone_body[6..8]}"
    }
  end

  def get_account_data
    render_400 and return unless user_validated?
    decrypt_business_name
    decrypt_tax_identification
    decrypt_phone_body
    decrypt_email
    @response = { businessName: @business_name,
                  taxIdentification: @tax_identification,
                  phoneCountryCode: @user.phone['phone_code'], phoneBody: @phone_body,
                  email: @email }
    render_200
  end
end