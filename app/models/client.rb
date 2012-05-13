class Client < ActiveRecord::Base
  attr_accessible :api_key, :secret
end
