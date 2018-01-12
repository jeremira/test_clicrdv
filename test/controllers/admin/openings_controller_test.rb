require 'test_helper'

class Admin::OpeningsControllerTest < ActionController::TestCase
  setup do
    @controller = Admin::OpeningsController.new
    @calendar = calendars(:one)
    @opening = openings(:one)
  end

  test 'should get index' do
    get :index, calendar_id: @calendar.id
    assert_response :success
    assert_not_nil assigns(:openings)
  end

  test 'should get new' do
    get :new, calendar_id: @calendar.id
    assert_response :success
  end

  test 'should create opening' do
    assert_difference('Opening.count') do
      post :create, calendar_id: @calendar.id, opening: {
        calendar_id: @opening.calendar_id,
        end_at: @opening.end_at,
        start_at: @opening.start_at
      }
    end

    assert_redirected_to admin_calendar_opening_path(@calendar, assigns(:opening))
  end

  test 'should show opening' do
    get :show, id: @opening.id, calendar_id: @calendar.id
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @opening.id, calendar_id: @calendar.id
    assert_response :success
  end

  test 'should update opening' do
    patch :update, id: @opening.id, calendar_id: @calendar.id, opening: {
      calendar_id: @opening.calendar_id,
      end_at: @opening.end_at,
      start_at: @opening.start_at
    }
    assert_redirected_to admin_calendar_opening_path(@calendar, assigns(:opening))
  end

  test 'should destroy opening' do
    assert_difference('Opening.count', -1) do
      delete :destroy, id: @opening, calendar_id: @calendar.id
    end

    assert_redirected_to admin_calendar_openings_path(@calendar)
  end
end
