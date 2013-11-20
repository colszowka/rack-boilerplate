require 'spec_helper'

describe App do
  include Rack::Test::Methods
  describe 'An isolated rack app for unit-testing' do
    let(:app) { App::Demo }

    it "responds with Yeehaw" do
      get '/'
      expect(last_response.body).to include('Yeehaw')
    end
  end

  describe 'The whole Routes constant for integration testing' do
    let(:app) { Routes }

    it "responds with Yeehaw at /" do
      get '/'
      expect(last_response.body).to include('Yeehaw')
    end

    it "responds with Lobsters at /lobster" do
      get '/lobster'
      expect(last_response.body).to include('Lobstericious')
    end
  end
end