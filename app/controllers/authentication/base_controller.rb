class Authentication::BaseController < ApplicationController
  layout "auths/index"
  include SessionsHelper
  
end