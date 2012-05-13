require 'rubygems'
require 'oauth'

# make the consumer out of your secret and key
consumer_key = "5HKnC0PhToyl86R6yj5RgGlWfotKo9x6vpkQvzDv"
consumer_secret = "gl4ofLzDD92Qfe4P3EclojTcT75QF5n0ndmTpXHr"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "http://localhost:3000",
                               :request_token_path => "/oauth/request_token",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/access_token",
                               :http_method => :get)

# make the access token from your consumer
access_token = OAuth::AccessToken.new consumer

# make a signed request!
res = access_token.get("/api/guest_events.json")

p res.body