class OwnerController < ApplicationController
  before_action :check_auth
  skip_before_action :authenticate_owner!

  def check_auth
    unless owner_signed_in?
      redirect_to landing_page_index_path
    end
  end

end
