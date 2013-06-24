# coding: utf-8
require 'oauth'
 
oauth = OAuth::Consumer.new('Z8NQbTe467BSFZU6ICHtEQ', # CONSUMER_KEY
                            'ttyuJr60ezS15iC6Ug7KER4xlM4HGPqCOlXKUJk8pM', # CONSUMER_SECRET
                            site: 'https://api.twitter.com/')
 
request_token = oauth.get_request_token
 
puts "Please access this URL: \n#{request_token.authorize_url}"
print "Enter your PIN code: "
pin = gets.to_i
 
access_token = request_token.get_access_token(oauth_verifier: pin)
 
puts "oauth_token: #{access_token.token}"
puts "oauth_token_secret: #{access_token.secret}"
