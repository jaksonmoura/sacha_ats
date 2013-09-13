require "spec_helper"

describe TechnicalsController do
  describe "routing" do

    it "routes to #index" do
      get("/technicals").should route_to("technicals#index")
    end

    it "routes to #new" do
      get("/technicals/new").should route_to("technicals#new")
    end

    it "routes to #show" do
      get("/technicals/1").should route_to("technicals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/technicals/1/edit").should route_to("technicals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/technicals").should route_to("technicals#create")
    end

    it "routes to #update" do
      put("/technicals/1").should route_to("technicals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/technicals/1").should route_to("technicals#destroy", :id => "1")
    end

  end
end
