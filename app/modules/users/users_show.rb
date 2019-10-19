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
    return render_bad_request unless user_validated?

    decrypt_business_name
    decrypt_tax_identification
    decrypt_phone_body
    decrypt_email
    @response = {
      business_name: @business_name,
      tax_identification: @tax_identification,
      phone_country_code: @user.phone['phone_code'],
      phone_body: @phone_body,
      email: @email
    }
    render_ok
  end
end
