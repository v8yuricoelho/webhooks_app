This application listens GitHub events by webhooks and exposes it by an api

* Ruby version

	- 2.5.1

* Rails version

	- Rails 6.0.2.1

* System dependencies
	
	- Git
	- PostgreSQL
	- ngrok

* Configuration

	- Database default configured with postgresql database and gem pg 
	- Set database username and password at /config/database.yml file

* Creating a webhook repository at GitHub and configuring
	
	First, create a new repository at GitHub(github.com). After that, go to the settings page of your repository. From there, click "Webhooks", then "Add webhook".

	The next step is start the ngrok with:
		
		$ ./ngrok http 3000

	It will generate a public url that will route to your local host, for example:
		
		http://0b6456ba.ngrok.io

	Copy this and go to /config/environments/development.rb in the application code, search for (line 64):

		config.hosts << ""

	Paste the URL between the double quotes. Then paste as well on "Payload URL" in the settings page of your repository and add "/events", it would look like this:

		http://0b6456ba.ngrok.io/events

	In the field "Content type" you can select any option. Now, it's time to set a secret token for the GitHub and your server. First generate the random string at terminal:

		$ ruby -rsecurerandom -e 'puts SecureRandom.hex(20)'

	Copy the output and fill out "Secret" box at GitHub. Click "Let me select individual events" and then "Issues". Make sure you select "Active" to to receive issue events for triggered webhooks.

	Next, set up an environment variable on your server that stores the token. Typically, this is as simple as running:
		
		$ export SECRET_TOKEN=your_token

* Up and running the application
	
	To initialize, inside folder's project, run:

		$ bundle install
		$ rails db:create
		$ rails db:migrate
		$ rails db:migrate RAILS_ENV=test

	To run:

		$ rails server	

* How to run the test suite

		$ rspec
