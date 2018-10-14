class ShortUrlDetail < ApplicationRecord
	require 'geoip'
	require 'open-uri'

	belongs_to :short_url
	before_create :locate

	def locate
		geoip = GeoIP.new("#{Rails.root}/db/GeoLiteCity.dat")
		remote_ip = open('http://whatismyip.akamai.com').read
		location = geoip.city(remote_ip)

		self.ip_address = remote_ip
		self.location = location[:city_name].to_s + ', ' + location[:country_name].to_s
	end
end