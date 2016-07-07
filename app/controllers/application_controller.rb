class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_owner!
  before_action :authenticate_contributor!  
  protect_from_forgery with: :exception
end
