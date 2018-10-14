class Api::V1::ShortUrlDetailsController < ApplicationController
	def index
		url = ShortUrl.new
		url.simplified_url = params[:url]
		url.simplify
		@url_obj = ShortUrl.find_by_simplified_url(url.simplified_url)

		if !@url_obj.short_url.nil?
			@url_obj.short_url = 'http://' + request.host_with_port + '/' + @url_obj.short_url.to_s
		end
		
		@detail_obj = ShortUrlDetail.joins(:short_url).where(short_urls: {simplified_url: url.simplified_url})
	end
end