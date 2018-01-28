class CalendarsController < ApplicationController

  before_action :set_calendar, only: [:availabilities]

  def show
  end

  def availabilities
    intervention = @calendar.interventions.find_by_id(params[:intervention_id])
    availabilities = @calendar.availabilities(intervention)
    respond_to do |format|
      format.json { render availabilities }
    end
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

end
