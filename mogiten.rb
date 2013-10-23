#coding: utf-8
require 'tweetstream'
require 'twitter'
require '../access_token.rb'

open('./random.txt')do|file|
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

#userstream thread
usrThre=Thread.new do
	usr_client = TweetStream::Client.new
	usr_client.userstream do |status|
		if status.in_reply_to_screen_name==MY_NAME #同報時に取得漏れを起こす
			tweet="@#{status.user.screen_name} #{$rand.shuffle.first}"
			puts tweet
		end
	end
end
#pubricstream thread
pubThre=Thread.new do
	pub_client = TweetStream::Client.new
	pub_client.track('#nowplaying') do |status|
		print "\e[32m@#{status.user.screen_name}\e[m" #後で調整。色変える
		puts "\s"+status.text
	end
end

loop do
end
