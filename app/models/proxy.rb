class Proxy

  def self.get(url)
    response = HTTParty.get(url)
    if response.success?
      response.body
    end
  end

end
