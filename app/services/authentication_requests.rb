class AuthenticationRequests
  include HTTParty
  base_uri 'https://login.zype.com'

  def initialize
    @client_id = '61255480307354ebd4d094482f2483adec9942637979aa5c3963ecbac469f943'
    @client_secret = '926e632b2aa9758f60dbdf2f8de13bebd9a04dfd602de4c257b3f8b4a97cf0b8'
  end

  def signin(username, password)
    self.class.post("/oauth/token", { query: { 
    	client_id: @client_id, client_secret: @client_secret,
    	username: username, password: password, grant_type: 'password'
    }})
  end
end