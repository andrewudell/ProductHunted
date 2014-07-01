class Product < ActiveRecord::Base
	validates :link, presence: true, uniqueness: true
end
