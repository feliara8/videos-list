class ZypeRequests
  include HTTParty
  base_uri 'https://api.zype.com'

  def initialize
    @options = {}
  end

  def videos(page = 0)
    self.class.get("/videos", @options.merge({ query: { page: page, app_key: 'XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf' }}))
  end

  def signin
  end
end