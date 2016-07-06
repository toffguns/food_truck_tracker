require 'rails_helper'

RSpec.describe "TimeAndPlaces", type: :request do
  describe "GET /time_and_places" do
    it "works! (now write some real specs)" do
      get time_and_places_path
      expect(response).to have_http_status(200)
    end
  end
end
