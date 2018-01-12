require 'test_helper'

class Admin::AppointmentsControllerTest < ActionController::TestCase
  setup do
    @controller = Admin::AppointmentsController.new
    @appointment = appointments(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create appointment' do
    assert_difference('Appointment.count') do
      post :create, appointment: {
        calendar_id: @appointment.calendar_id,
        customer_name: @appointment.customer_name,
        end_at: @appointment.end_at,
        intervention_id: @appointment.intervention_id,
        start_at: @appointment.start_at
      }
    end

    assert_redirected_to admin_appointment_path(assigns(:appointment))
  end

  test 'should show appointment' do
    get :show, id: @appointment
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @appointment
    assert_response :success
  end

  test 'should update appointment' do
    patch :update, id: @appointment, appointment: {
      calendar_id: @appointment.calendar_id,
      customer_name: @appointment.customer_name,
      end_at: @appointment.end_at,
      intervention_id: @appointment.intervention_id,
      start_at: @appointment.start_at
    }
    assert_redirected_to admin_appointment_path(assigns(:appointment))
  end

  test 'should destroy appointment' do
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment
    end

    assert_redirected_to admin_appointments_path
  end
end
