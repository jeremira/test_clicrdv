class Appointment < ActiveRecord::Base
  include TimeContinium
  # Associations
  belongs_to :calendar
  belongs_to :intervention

  # Validations
  validates :calendar_id, presence: true
  validates :intervention_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :customer_name, presence: true
  validate :end_come_after_start
end
