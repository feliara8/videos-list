# handle zype requests
class ZypeRequests
  include HTTParty
  base_uri 'https://api.zype.com'

  def initialize
    @options = {}
  end

  def videos(page = 0, query = '')
    self.class.get('/videos', @options.merge({ query: {
      q: query,
      page: page,
      app_key: ENV['APP_KEY']
    } }))
  end
end
