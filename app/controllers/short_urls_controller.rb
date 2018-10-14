class ShortUrlsController < ApplicationController
	def show
		url = ShortUrl.find_by_short_url(params[:short_url])
		if !url.nil?
			detail_obj = ShortUrlDetail.new
			detail_obj.short_url_id = url.id
			detail_obj.save

			p 'a'
			redirect_to url.simplified_url
		else
			redirect_to root_path
		end
	end

	def index
		@url_obj = ShortUrl.all
	end
end