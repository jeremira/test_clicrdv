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
    @duration = @duration * 60
    @interval = @interval * 60
  end

  def make_my_planning

    openings = @openings
    appointments = @appointments
    slot = @slot
    duration = @duration

    openings.each do |opening|
      #start at the start of the current opening
      slot = { start_at: opening[:start_at], end_at: opening[:start_at] + duration }
      #iterate until opening is ended
      while slot[:start_at] + duration <= opening[:end_at]
        slot_is_valid = true
        appointments.each do |rdv|
          if rdv[:start_at] < slot[:end_at] && slot[:start_at] < rdv[:end_at]
            slot_is_valid = false
            slot = { start_at: rdv[:end_at],
                     end_at:   rdv[:end_at] + duration }
            #add a break
          else
            #rien ici ?
          end
        end
        #push valid slot et setup next slot
        if slot_is_valid
          green_spots << slot
          slot = { start_at: green_spots.last[:start_at] + interval,
                   end_at:   green_spots.last[:start_at] + interval + duration }
        else

        end


      end #end while
    end #end openings.each
  end #end make my planning

  private


end
