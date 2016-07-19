class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :store_current_location, :unless => :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    # current_owner
    # current_contributor
      if !session[:contributor_return_to].nil?
    if (session[:contributor_return_to] == "/landing_page/map_location" && contributor_signed_in?) ||
        session[:contributor_return_to][0,36] == "/landing_page/get_markers_by_address" ||
        session[:contributor_return_to][0,20] == "/landing_page/search"
      session[:contributor_return_to] = "/"
    elsif owner_signed_in?
      session[:owner_return_to] = "/owners/" + current_owner.id.to_s
    else
      session[:contributor_return_to] || root_path
    end
  end
end

#   private
#   # override the devise helper to store the current location so we can
#   # redirect to it after loggin in or out. This override makes signing in
#   # and signing up work automatically.
  def store_current_location
    store_location_for(:contributor, request.url)
  end
#
#   def after_sign_in_path_for(resource_or_scope)
#     session[:previous_url] || root_path
#   end
# # #
end
