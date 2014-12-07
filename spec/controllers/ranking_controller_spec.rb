require 'spec_helper'

describe RankingController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'log:text'" do
    it "returns http success" do
      get 'log:text'
      response.should be_success
    end
  end

end
