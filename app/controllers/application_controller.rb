class ApplicationController < ActionController::Base
  protect_from_forgery except: :index
  include SerializableResource
  include SessionsHelper
end
