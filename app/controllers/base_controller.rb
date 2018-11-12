class BaseController < ApplicationController
   before_action :authenticate_http

   def authenticate_http
    user = 'admin'
    pass = 'admin'
    authenticate_or_request_with_http_basic do |username, password|
      username == user && password == pass
    end
  end
end