class PlanningFiller

  attr_accessor :openings, :appointments, :interval, :duration,
                :green_spots, :slot

  def initialize params = {}
    @openings     = params[:openings]     || []
    @appointments = params[:appointments]  || []
    @interval     = params[:interval]      || 10
    @duration     = params[:duration]      || 0
    @green_spots  = []
    @slot = {start_at: nil, end_at: nil}
    @duration = @duration * 60
    @interval = @interval * 60
  end

  def make_my_planning
    openings.each do |opening|
      #start at the start of the current opening
      slot = { start_at: opening[:start_at], end_at: opening[:start_at] + duration }
      #iterate until opening is ended
      while we_have_time_to_work opening, slot
        slot_is_valid = true
        #check for already planned appointment on this slot
        appointments.each do |rdv|
          if a_appointment_overlap rdv, slot
            slot_is_valid = false
            #next slot start after the appointment
            slot = { start_at: rdv[:end_at],
                     end_at:   rdv[:end_at] + duration }
            #add a break ?
          end
        end
        if slot_is_valid
          green_spots << slot
          #next slot start after the interval
          slot = { start_at: green_spots.last[:start_at] + interval,
                   end_at:   green_spots.last[:start_at] + interval + duration }
        end
      end #end while
    end #end openings.each
  end

  def all_free_starting
    green_spots.map { |slot| slot[:start_at].strftime('%Y-%d-%m %H:%M:%S') }
  end

  private
    
    def we_have_time_to_work opening, slot
      slot[:start_at] + duration <= opening[:end_at]
    end

    def a_appointment_overlap rdv, slot
      rdv[:start_at] < slot[:end_at] && slot[:start_at] < rdv[:end_at]
    end

end
