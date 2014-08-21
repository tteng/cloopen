#####Setup Yuntonxin SMS PARAMETERS ####
Cloopen.setup do |config|
  config.account_sid = "YOUR_ACCOUNT_SID"
  config.auth_token  = "YOUR_AUTH_TOKEN"
  config.app_id = "YOUR_APP_ID"
  config.sms_uri = Rails.env.production? ? "https://app.cloopen.com:8883/2013-12-26/Accounts/" : 
                                             "https://sandboxapp.cloopen.com:8883/2013-12-26/Accounts/"
  end
end
