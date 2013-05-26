require 'test_helper'

class UserLookupTest < ActionDispatch::IntegrationTest
  test "looking up an existing user" do
    visit '/'

    fill_in 'username', :with => 'jakeboxer'
    click_button 'is my name on Twitter'

    assert page.has_content?('jakeboxer'), "Username should be on the page"
  end
end
