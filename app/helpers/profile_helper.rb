require 'httparty'

module ProfileHelper
  def send_sms(mobile_number, code)
    userid = Rails.application.secrets.sms_userid
    passwd = Rails.application.secrets.sms_passwd
    senderid = Rails.application.secrets.sms_senderid
    url = Rails.application.secrets.sms_url
    puts code
    request = HTTParty.get(
      url, query: {
        username: userid,
        password: passwd,
        senderid: senderid,
        to: mobile_number,
        text: code
      })
    
    request.parsed_response
  end
end
