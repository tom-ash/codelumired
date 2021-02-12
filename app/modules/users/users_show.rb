module UsersShow
  def phone
    @user = Announcement.find(params[:id]).user
    @phone_code = @user.phone['code']
    @phone_body = @user.phone['body']
    render json: {
      phone: "#{@phone_code} #{@phone_body[0..2]} #{@phone_body[3..5]} #{@phone_body[6..8]}"
    }
  end

  private

  def account_type_specific_attributes
    if @user.professional_account?
      return {
        business_name: @user.business_name,
        tax_number: @user.tax_number
      }
    end

    {
      first_name: @user.first_name,
      last_name: @user.last_name
    }
  end
end
