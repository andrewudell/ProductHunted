require 'open-uri'
require 'net/http'

# Scrapes ProductHunt and pings the Yo api if necessary
#
# @example
#
#     require 'yo_api'
#
#     YoApi.run
class YoApi

	NUM_VOTES = 50 # if votes > NUM_VOTES, will ping
	API_TOKEN = ENV["YO_API_TOKEN"]
	API_ENDPOINT = "http://api.justyo.co/yoall/"

	# check if should ping, and if should ping, do it
	def self.run
		if self.should_ping_api?
			self.ping_api
		end
	end

	# parse product hunt to see if should ping
	def self.should_ping_api?
		# load Nokogiri
		doc = Nokogiri::HTML(open("http://www.producthunt.com"))

		# get all ratings
		ratings = doc.css('.today .vote-count').map {|r| r.text}

		# return if any rating is creater than NUM_VOTES
		ratings.any? do |r|
			r.to_i >= NUM_VOTES
		end
	end

	# ping the api
	def self.ping_api
		uri = URI(API_ENDPOINT)
		Net::HTTP.post_form(uri, 'api_token' => API_TOKEN)
	end

end