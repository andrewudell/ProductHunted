require_relative '../rails_helper'

# only testing should_ping_api? b/c other methods are trivial
describe YoApi, "#should_ping_api?" do

	before(:each) do
		# get doc containing product_hunted, with 2 products > 100 votes
		file_location = File.join(File.dirname(__FILE__), '../data/index.html')
		@doc = Nokogiri::HTML(File.read(file_location))
	end

	it "be true if parsing a page with product > 100 votes" do
		expect(YoApi.should_ping_api?(@doc)).to be(true)
	end

	it "be true if parsing page with 2 prods > 100 votes, and one already stored" do
		Product.where(link: "/l/e2ea2a928a").first_or_create # add one product

		expect(YoApi.should_ping_api?(@doc)).to be(true)
	end

	it "be false if parsing page with prod > 100 votes but already in database" do
		# add both products
		Product.where(link: "/l/e2ea2a928a").first_or_create
		Product.where(link: "/l/8648b01735").first_or_create

		expect(YoApi.should_ping_api?(@doc)).to be(false)
	end
end