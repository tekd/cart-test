module Api
  class ApiController < ApplicationController
    skip_before_filter :verify_authenticty_token
  end
end