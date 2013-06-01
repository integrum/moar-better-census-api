class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  attr_accessor :api_key

  def index
    head :ok
  end

  protected
  def authenticate
    return if api_key.present?
    authenticate_or_request_with_http_basic do |username, password|
      @api_key ||= username
    end
  end
end
