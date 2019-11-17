module UsersShow
  def phone
    @user = Announcement.find(params[:id]).user
    @phone_code = @user.phone['code']
    @phone_body = @user.phone['body']
    render json: {
      phone: "#{@phone_code} #{@phone_body[0..2]} #{@phone_body[3..5]} #{@phone_body[6..8]}"
    }
  end

  def fetch_account_data
    return bad_request unless user_validated?

    @response = {
      business_name: @user.business_name,
      tax_number: @user.tax_number,
      phone_code: @user.phone['code'],
      phone_body: @user.phone['body'],
      email: @user.email
    }
    ok
  end
end
