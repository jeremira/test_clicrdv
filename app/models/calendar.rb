class Calendar < ActiveRecord::Base
  # Associations
  has_many :interventions
  has_many :openings
  has_many :appointments

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :intervals, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def availabilities intervention
    params = {
      openings: self.openings,
      appointments: self.appointments,
      interval: self.intervals,
      duration: intervention.duration
    }
    my_planning = PlanningFiller.new(params)
    my_planning.make_my_planning
    my_planning.green_spots.inspect
    return my_planning.all_free_starting
  end

end
