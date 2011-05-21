require 'test_helper'

class PresentationsControllerTest < ActionController::TestCase
  setup do
    @presentation = presentations(:gettysburg_address)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presentations)
  end

  test "should not get new" do
    assert_raises ActionController::RoutingError do
      get :new
    end
  end

  test "should not create presentation" do
    assert_raises ActionController::RoutingError do
      post :create, :presentation => @presentation.attributes
    end
  end

  test "should not show presentation" do
    assert_raises ActionController::RoutingError do
      get :show, :id => @presentation.to_param
    end
  end

  test "should not get edit" do
    assert_raises ActionController::RoutingError do
      get :edit, :id => @presentation.to_param
    end
  end

  test "should not update presentation" do
    assert_raises ActionController::RoutingError do
      put :update, :id => @presentation.to_param, :presentation => @presentation.attributes
    end
  end

  test "should not destroy presentation" do
    assert_raises ActionController::RoutingError do
      delete :destroy, :id => @presentation.to_param
    end
  end
end
