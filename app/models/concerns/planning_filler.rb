class PlanningFiller

  attr_accessor :openings, :appointments, :break_time, :duration,
                :all_possible_rdv, :possible_rdv

  def initialize params = {}
    @openings    = params[:openings]      || []
    @appointments = params[:appointments] || []
    @break_time  = params[:break_time]    || 0
    @duration    = params[:duration]      || 0
    @all_possible_rdv = []
    @possible_rdv = {start_at: nil, end_at: nil, green: false}
  end

  private


end
