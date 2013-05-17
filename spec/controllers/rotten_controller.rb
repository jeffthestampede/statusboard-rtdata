require 'spec_helper'

describe RottenController do

  describe "#index" do

    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

  end

  describe "#morris" do
    it "responds successfully" do
      get :morris
      expect(response).to be_success
    end

    it "assigns a data array" do
      get :morris
      expect(assigns(:data)).to be_an Array
    end
  end



  describe "statusboard" do


    before :each do
      get :statusboard
      @data = assigns (:data)
      @response = response

    it "assigns a data hash" do
      expect(@response).to be_success
    end

    it "data hash contains a graph key" do
      expect(@data["graph"]).to be_a Hash
    end

    it "graph has a title" do
      expect(@data["graph"]["title"]).to eq "Ratings of Top 10 Movies This Week"
    end

    it "graph contains data sequences" do
      expect(@data["graph"]["datasequences"]).to be_an Array
    end

  end
end