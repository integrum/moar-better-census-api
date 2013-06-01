module AuthHelper
  def http_login
    username = 'some_key'
    password = ''
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username,password)
  end  
end
