require 'test_helper'

class Admin::InterventionsControllerTest < ActionController::TestCase
  setup do
    @controller = Admin::InterventionsController.new
    @intervention = interventions(:one)
    @calendar = calendars(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:interventions)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create intervention' do
    assert_difference('Intervention.count') do
      post :create, intervention: {
        calendar_id: @intervention.calendar_id,
        duration: @intervention.duration,
        name: @intervention.name,
        price: @intervention.price
      }
    end

    assert_redirected_to admin_intervention_path(assigns(:intervention))
  end

  test 'should show intervention' do
    get :show, id: @intervention
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @intervention
    assert_response :success
  end

  test 'should update intervention' do
    patch :update, id: @intervention, intervention: {
      calendar_id: @intervention.calendar_id,
      duration: @intervention.duration,
      name: @intervention.name,
      price: @intervention.price
    }
    assert_redirected_to admin_intervention_path(assigns(:intervention))
  end

  test 'should destroy intervention' do
    assert_difference('Intervention.count', -1) do
      delete :destroy, id: @intervention
    end

    assert_redirected_to admin_interventions_path
  end
end
