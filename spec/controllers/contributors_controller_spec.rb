require 'rails_helper'

RSpec.describe ContributorsController, type: :controller do

  describe "GET #check_auth" do
    it "returns http success" do
      get :check_auth
      expect(response).to have_http_status(:success)
    end
  end

end
