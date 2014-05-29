class Admin::BaseController < ApplicationController
  # before_filter :password_protect

  def index
    @directors = Director.all
  end

  private

  def password_protect
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == 'password'
    end
  end
end
