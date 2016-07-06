class LandingPageController < ApplicationController
  skip_before_action :authenticate_owner!
  
  def index
  end
end
