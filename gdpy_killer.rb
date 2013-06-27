#coding: utf-8
require 'tweetstream'
require 'twitter'
require '../access_token.rb'

open('./gdpy.txt')do|file|
	$rand=file.readlines.collect{|line|line.strip}
end


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
str_client = TweetStream::Client.new
str_client.userstream do |status|
	if status.in_reply_to_screen_name==MY_NAME
	#if stasus.user.screen_name=='take01x'&&
		tweet="@#{status.user.screen_name} #{$rand.shuffle.first}"
		Twitter.update(tweet,:in_reply_to_status_id => status.id)
	end
end
