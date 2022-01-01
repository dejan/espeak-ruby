# frozen_string_literal: true

require 'demo'
require 'rack/test'

describe Demo do
  include Rack::Test::Methods

  subject(:app) { Demo }

  it 'responds OK for root path' do
    get '/'
    expect(last_response).to be_ok
  end
end
