class PlanningFiller
  attr_accessor :openings, :appointments, :break_time, :duration

  def initialize params = {}
    @openings    = params[:openings]      || []
    @appointments = params[:appointments] || []
    @break_time  = params[:break_time]    || 0
    @duration    = params[:duration]      || 0
  end

  private

end
