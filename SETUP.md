# Product Hunted - Dev

- Getting setup
    - After the initial Vagrant up
        - `vagrant ssh`
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
	- Commit changes to the Rails git
	    - from app directory, do `git add .` and `git commit`
	    - `git push heroku master`


- Adding new features
	- Pull changes from master
	    - `git checkout master`
	    - `git pull master`
	- Create a branch
	    - `git checkout -b name-feature-description`
	- Push the branch
	    - `git push -u origin branchname`
	- Merge the branch on github
	- Delete the branch
	    - `git branch -D branch-name` (locally)
