require 'rubygems'
require 'oauth'

# make the consumer out of your secret and key
consumer_key = "6N7MzvA5iZ796dziTlLw707FFM0lN27rtIMsnuKY"
consumer_secret = "g0OvINEGgWxvhMXouNdg8Tz6TENlroY3nGQONeje"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "http://blooming-spring-8178.herokuapp.com",
                               :request_token_path => "/oauth/request_token",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/access_token",
                               :http_method => :get)

# make the access token from your consumer
access_token = OAuth::AccessToken.new consumer

# make a signed request!
# res = access_token.get("/api/guest_events.json?evnet_id=1")
# 
# puts res.body

rq = consumer.create_signed_request :get, "/api/guest_events.json?evnet_id=1", access_token
puts rq.to_hash