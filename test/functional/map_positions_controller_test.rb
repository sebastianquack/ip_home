require 'test_helper'

class MapPositionsControllerTest < ActionController::TestCase
  setup do
    @map_position = map_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:map_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create map_position" do
    assert_difference('MapPosition.count') do
      post :create, map_position: {  }
    end

    assert_redirected_to map_position_path(assigns(:map_position))
  end

  test "should show map_position" do
    get :show, id: @map_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @map_position
    assert_response :success
  end

  test "should update map_position" do
    put :update, id: @map_position, map_position: {  }
    assert_redirected_to map_position_path(assigns(:map_position))
  end

  test "should destroy map_position" do
    assert_difference('MapPosition.count', -1) do
      delete :destroy, id: @map_position
    end

    assert_redirected_to map_positions_path
  end
end
