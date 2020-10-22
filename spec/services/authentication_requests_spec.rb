require 'spec_helper'

RSpec.describe AuthenticationRequests do
  it 'authenticates' do
    response = AuthenticationRequests.new.signin('test@test.com', 'password')
    expect(response['access_token'].present?).to be true
  end
end
