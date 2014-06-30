# Product Hunted - Dev

- Getting setup
    - After the initial Vagrant up
        - Install rvm
	     - `\curl -sSL https://get.rvm.io | bash`
	     - Install Ruby 2.0.0
	         - `rvm install 2.0.0`
		 - `rvm use 2.0.0`
        - Install Rails
	    - `gem install rails`
	- Install the gems (from rails app dir)
	    - `bundle install`
	- Install the database (from rails app dir)
	    - `rake db:create db:migrate`

- Running app
	- `rails s`

- Deploying