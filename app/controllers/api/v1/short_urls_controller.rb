class Api::V1::ShortUrlsController < ApplicationController
	require 'open-uri'

	def new
		# create data
		@url_obj = ShortUrl.new
		@url_obj.simplified_url = params[:url]
		@url_obj.simplify
		if !@url_obj.simplified_url.blank?
			@url_obj.check_exist
			if @url_obj.short_url.nil?
				@url_obj.save
			end
		end

		if !@url_obj.short_url.nil?
			@url_obj.short_url = 'http://' + request.host_with_port + '/' + @url_obj.short_url.to_s
		end
	end
end