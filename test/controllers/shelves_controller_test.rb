require 'test_helper'

class ShelvesControllerTest < ActionController::TestCase

  def setup
    @shelf = shelves(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Shelf.count' do
      post :create, shelf: { name: "Shelf A", description: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Shelf.count' do
      delete :destroy, id: @shelf
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong shelf" do
    log_in_as(users(:jacob))
    library = shelves(:virusvideo).library
    shelf = library.shelves.first
    assert_no_difference 'Shelf.count' do
      delete :destroy, id: shelf
    end
    assert_redirected_to root_url
  end
end