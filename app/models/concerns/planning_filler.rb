class PlanningFiller

  attr_accessor :openings, :appointments, :interval, :duration,
                :green_spots, :slot

  def initialize params = {}
    @openings     = params[:openings]      || []
    @appointments = params[:appointments]  || []
    @interval     = params[:interval]      || 10
    @duration     = params[:duration]      || 0
    @green_spots  = []
    @slot = {start_at: nil, end_at: nil}
  end

  private


end
