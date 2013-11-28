require "spec_helper"

describe TeasController do
  describe "routing" do

    it "routes to #index" do
      get("/teas").should route_to("teas#index")
    end

    it "routes to #new" do
      get("/teas/new").should route_to("teas#new")
    end

    it "routes to #show" do
      get("/teas/1").should route_to("teas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teas/1/edit").should route_to("teas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teas").should route_to("teas#create")
    end

    it "routes to #update" do
      put("/teas/1").should route_to("teas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teas/1").should route_to("teas#destroy", :id => "1")
    end

  end
end
