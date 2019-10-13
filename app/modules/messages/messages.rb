module Messages
  def send_sms
    send_sms_with_smslabs
  end

  private

  def send_sms_with_smslabs
    app_key = Rails.application.secrets.smslabs_app_key
    secret_key = Rails.application.secrets.smslabs_secret_key
    auth = 'Basic ' + Base64.strict_encode64("#{app_key}:#{secret_key}")
    data = {
      'flash' => flash,
      'expiration' => expiration,
      'phone_number' => @phone,
      'sender_id' => 'warsawlease',
      'message' => @message
    }
    headers = {
      "Content-Type" => 'application/x-www-form-urlencoded',
      "Content-Length" => data.to_s.length.to_s,
      "Authorization" => auth
    }
    begin
      RestClient.put("https://api.smslabs.net.pl/apiSms/sendSms", data, headers)
    rescue RestClient::InternalServerError
      nil
    end
  end

  def flash
    @flash || '0'
  end

  def expiration
    @expiration || '0'
  end
end