# twitter_feed

A simple twitter feed given a username.

## Requirements

Please create a Rails 4 app that does the following:

* Display a form with a single input, where the user can type a Twitter user’s handle
* When the user submits the form, do an AJAX call that submits the form to the backend.  The backend will need to do an API call to the Twitter API to get the user’s last 10 tweets, using the /user_timeline endpoint, documented here: https://dev.twitter.com/rest/reference/get/statuses/user_timeline
* When the API call is returned, save the Twitter user into a table called “users”, and save each of the tweets in a table called “tweets”, but don’t save the same tweet twice.  For example, if I submit this form twice, it should still only save the last 10 tweets once.  It’s up to you to determine which fields of both the user and tweets you want to save.  Make sure that a User model and Tweet model are created and the appropriate association is made between the two.
* Output the result of the last 10 tweets to the HTML DOM without refreshing the screen.

## Setup

1. Clone the repository:

```
$ git clone https://github.com/alexanderdavidpan/twitter_feed.git
```

2. Install dependencies:

```
$ bundle install
```

or if you're lazy like me just run `bundle` because the default option to bundle is install...

```
$ bundle
```

3. Migrate the database:

```
$ rake db:migrate
```

4. WARNING: In order to authenticate with Twitter, you will need to provide credentials such as CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, and ACCESS_TOKEN_SECRET. I did not include this sensitive info in my public git repo. You must ask me for the credentials or use your own. Once you have it, create a file called config/twitter.yml and store the data there.

5. Start Rails server locally:

```
$ rails s
```

6. Open a browser and go to http://localhost:3000/ (assuming you did not specify a port option in step 4 and just used the default Rails port)


## Testing

To Run tests:

1. Run db migrate for test environment:

```
rake db:migrate RAILS_ENV=test
```

2. Run tests:

```
rake test
```
