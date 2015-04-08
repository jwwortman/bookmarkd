require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:jacob)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.library.shelves.count.to_s, response.body
    assert_select 'div.pagination'
    @user.library.shelves.paginate(page: 1).each do |shelf|
      assert_match shelf.name, response.body
      assert_match shelf.description, response.body
    end
  end
end