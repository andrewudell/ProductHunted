require_relative '../yo_api'

namespace :yo_api do
	desc "scrape product hunt and ping database"
	task :run => :environment do
		YoApi.run
	end
end
