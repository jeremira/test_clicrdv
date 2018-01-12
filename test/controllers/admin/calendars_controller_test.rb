require 'test_helper'

class Admin::CalendarsControllerTest < ActionController::TestCase
  setup do
    @controller = Admin::CalendarsController.new
    @calendar = calendars(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendars)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create calendar' do
    assert_difference('Calendar.count') do
      post :create, calendar: {
        name: @calendar.name + '_bis'
      }
    end

    assert_redirected_to admin_calendar_path(assigns(:calendar))
  end

  test 'should show calendar' do
    get :show, id: @calendar
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @calendar
    assert_response :success
  end

  test 'should update calendar' do
    patch :update, id: @calendar, calendar: {
      name: @calendar.name
    }
    assert_redirected_to admin_calendar_path(assigns(:calendar))
  end

  test 'should destroy calendar' do
    assert_difference('Calendar.count', -1) do
      delete :destroy, id: @calendar
    end

    assert_redirected_to admin_calendars_path
  end
end
