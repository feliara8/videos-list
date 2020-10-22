require 'spec_helper'

RSpec.describe ZypeRequests do
  it 'retrieves videos' do
  	response = ZypeRequests.new.videos(1, "")
  	expect(response["response"].present?).to be true
  end	
end