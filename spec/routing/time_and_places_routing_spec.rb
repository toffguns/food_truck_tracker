require "rails_helper"

RSpec.describe TimeAndPlacesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/time_and_places").to route_to("time_and_places#index")
    end

    it "routes to #new" do
      expect(:get => "/time_and_places/new").to route_to("time_and_places#new")
    end

    it "routes to #show" do
      expect(:get => "/time_and_places/1").to route_to("time_and_places#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/time_and_places/1/edit").to route_to("time_and_places#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/time_and_places").to route_to("time_and_places#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/time_and_places/1").to route_to("time_and_places#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/time_and_places/1").to route_to("time_and_places#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/time_and_places/1").to route_to("time_and_places#destroy", :id => "1")
    end

  end
end
