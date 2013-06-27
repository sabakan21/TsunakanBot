#coding: utf-8
require 'tweetstream'
require 'twitter'
require '../access_token.rb'
TweetStream.configure do |config|
	config.consumer_key=CONSUMER_KEY
	config.consumer_secret=CONSUMER_SECRET
	config.oauth_token=ACCESS_TOKEN
	config.oauth_token_secret=ACCESS_TOKEN_SECRET
        config.auth_method =:oauth
end

Twitter.configure do |config|
	config.consumer_key=CONSUMER_KEY
	config.consumer_secret=CONSUMER_SECRET
	config.oauth_token=ACCESS_TOKEN
	config.oauth_token_secret=ACCESS_TOKEN_SECRET
end

client = TweetStream::Client.new
client.userstream do |status|
	puts "#{status.user.name}(@#{status.user.screen_name})"
	puts "#{status.text}"
	puts "=============="
end

#twitter gem で色々かけるの？

