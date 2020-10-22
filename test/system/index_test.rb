require 'application_system_test_case'
require 'test_helper'

class IndexTest < ApplicationSystemTestCase
  test 'visit_index' do
    visit root_url
    # asserts vue loaded correctly
    assert_selector 'h1', text: 'Videos List'
  end
end
