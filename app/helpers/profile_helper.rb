require 'httparty'

def send_sms(mobile_number, code)
  userid = Rails.application.secrets.sms_userid
  passwd = Rails.application.secrets.sms_passwd
  url = Rails.application.secrets.sms_url
  request = HTTParty.get(
    url, query: {
      username: userid,
      password: passwd,
      to: mobile_number,
      text: code
    })
  
  request.parsed_response
end
