#coding: utf-8
require 'tweetstream'
require 'twitter'
TweetStream.configure do |config|
	config.consumer_key='Z8NQbTe467BSFZU6ICHtEQ'
	config.consumer_secret='ttyuJr60ezS15iC6Ug7KER4xlM4HGPqCOlXKUJk8pM'
	config.oauth_token='1243015320-u7IOwVmOnItBkMTK1vN3QOW2r29xfy8CJDqzQwB'
	config.oauth_token_secret='89Bp4X1IvY5UBEgJoAnOQmK3qLpWrB1LOCFywhY38yY'
        config.auth_method =:oauth
end

client = TweetStream::Client.new
client.userstream do |status|
	puts "#{status.user.name}(@#{status.user.screen_name})"
	puts "#{status.text}"
	puts "=============="
end

#twitter gem で色々かけるの？

