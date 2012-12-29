require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { date: @event.date, description_long_de: @event.description_long_de, description_long_en: @event.description_long_en, description_short_en: @event.description_short_en, description_short_en: @event.description_short_en, location_de: @event.location_de, location_en: @event.location_en, time: @event.time, title_de: @event.title_de, title_en: @event.title_en, url: @event.url }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { date: @event.date, description_long_de: @event.description_long_de, description_long_en: @event.description_long_en, description_short_en: @event.description_short_en, description_short_en: @event.description_short_en, location_de: @event.location_de, location_en: @event.location_en, time: @event.time, title_de: @event.title_de, title_en: @event.title_en, url: @event.url }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
