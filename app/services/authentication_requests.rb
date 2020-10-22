# handle auth requests
class AuthenticationRequests
  include HTTParty
  base_uri 'https://login.zype.com'

  def initialize
    @client_id = ENV['CLIENT_ID']
    @client_secret = ENV['CLIENT_SECRET']
  end

  def signin(username, password)
    self.class.post('/oauth/token', { query: {
      client_id: @client_id, client_secret: @client_secret,
      username: username, password: password, grant_type: 'password'
    } })
  end
end
