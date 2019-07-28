module Mailers
  def send_email
    send_email_with_emaillabs
    # send_email_with_mailgun
  end

  private

  def send_email_with_emaillabs
    @email_sender = "noreply@warsawlease.com"
    app_key = Rails.application.secrets.smslabs_app_key
    secret_key = Rails.application.secrets.emailabs_secret_key
    auth = 'Basic ' + Base64.strict_encode64("#{app_key}:#{secret_key}")
    data = {
      smtp_account: Rails.application.secrets.emailabs_smtp_account,
      from: @email_sender,
      from_name: "warsawlease.com",
      to: { "#{@email_recipient}": nil },
      subject: @email_subject,
      html: @email_html,
      text: "aaa"
    }
    headers = {  "Authorization" => auth }
    RestClient.post("https://api.emaillabs.net.pl/api/new_sendmail", data, headers)
  end

  def send_email_with_mailgun
    @email_sender = "noreply@warsawlease.com"
    RestClient.post "https://api:#{Rails.application.secrets.mailgun_api_key}" "@#{Rails.application.secrets.mailgun_api_path}",
      :from => @email_sender,
      :to => @email_recipient,
      :subject => @email_subject,
      :text => "aaa",
      :html => @email_html,
      'o:dkim' => 'yes'
  end
end