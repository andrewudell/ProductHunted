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

	NUM_VOTES = 150 # if votes > NUM_VOTES, will ping
	API_TOKEN = ENV["YO_API_TOKEN"]
	API_ENDPOINT = "http://api.justyo.co/yoall/"
	PRODUCT_HUNT_URL = 'http://www.producthunt.com'

	# check if should ping, and if should ping, do it
	def self.run
		doc = Nokogiri::HTML(open("http://www.producthunt.com"))
		link = self.should_ping_api?(doc)

		self.ping_api(link) unless link.empty?
	end

	# parse product hunt to see if should ping
	#
	# doc - the Nokogiri document
	def self.should_ping_api?(doc)
		# get all posts
		posts = doc.css('.today .post')

		posts.each do |p|
			if p.at_css('.vote-count').text.to_i > NUM_VOTES
				link = p.at_css('.post-url')['href']
				if Product.find_by(link: link).nil?
					Product.create!(link: link)

					return link
				end
			end
		end

		return ''
	end

	# ping the api
	def self.ping_api(link)
		uri = URI(API_ENDPOINT)
		link = "#{PRODUCT_HUNT_URL}#{link}"
		Net::HTTP.post_form(uri, 'api_token' => API_TOKEN, 'link' => link)
	end

end
