require "spec_helper"

describe PagesController do
  describe "routing" do

    it "root routes to pages#home" do
      get("/").should route_to("pages#home")
    end

  end
end
