module Concerns
  module Movieable
    
    protected
    
    def youtube(url)
      return if url.blank?

      id = url.match(/\?v=(.+)$/)[1]
      conn = Faraday.new(
        url: %Q(https://www.googleapis.com/youtube/v3/videos?part=id,snippet,statistics&id=#{id}&key=AIzaSyBBirrfgFjapXv1nd1TDKH1KvEAP26ptWE)
      ).get
      JSON.parse(conn.body.presence || {})["items"]
    end
  end
end
