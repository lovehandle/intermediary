class ProxyController < ApplicationController

  def page
    @url = params[:url]
  end

  def content
    @content = Proxy.get(params[:url])
    render text: @content, layout: false
  end

end
