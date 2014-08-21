# Cloopen

云通讯发送短信的 Gem.

## Installation

Add this line to your application's Gemfile:

    gem 'cloopen'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloopen

## Usage

### Config

1. 注册 [云通讯](http://www.yuntongxun.com) ，并通过企业认证（只有企业帐号才可以发短信）。

2. 在 [这个页面](http://www.yuntongxun.com/member/main) 查看 account_sid, auth_token

3. 在 [这个页面](http://www.yuntongxun.com/member/app/view) 创建 App，获得 app_id

4. 在 [这里](http://www.yuntongxun.com/member/smsTemplate/view) 创建你的短信模板，比如：

    `【薄荷减肥】您的的验证码是{1}`

5. 静静等待云通讯的管理员审核

  * App 通过审核
  * 短信模板通过审核

6. 通过审核后，在你的项目中设置以下配置文件

* ruby project

```ruby
Cloopen.account_sid = "Your Yuntongxun Account Sid"
Cloopen.auth_token = "Your Yuntongxun Auth token"
Cloopen.app_id = "Your Yuntongxun App id"
Cloopen.sms_uri = "https://app.cloopen.com:8883/2013-12-26/Accounts/"
```

* rails project

```ruby
  rails g cloopen
```

将生成一个cloopen_setup.rb到config/initialiers/目录下

```ruby
  Cloopen.setup do |config|
    config.account_sid = "YOUR_ACCOUNT_SID"
    config.auth_token  = "YOUR_AUTH_TOKEN"
    config.app_id = "YOUR_APP_ID"
    config.sms_uri = Rails.env.production? ? "https://app.cloopen.com:8883/2013-12-26/Accounts/" : 
                                               "https://sandboxapp.cloopen.com:8883/2013-12-26/Accounts/"
  end
```

### 发送消息

```ruby
  cs = Cloopen::Sms.new '15012345678', '1000', ["arg1", "ar2"...]
  cs.deliver
```
第一个参数是手机号码，第二个是模板id，第三个是对应消息

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cloopen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
