class ApplicationController < ActionController::Base
  class InvalidParameters < Exception ; end
  protect_from_forgery
end
