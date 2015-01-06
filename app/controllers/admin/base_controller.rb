class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :password_protect

  def index
    @active_directors = Director.active
    @inactive_directors = Director.inactive
  end

  private

  def password_protect
    return unless Rails.env.production?
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
