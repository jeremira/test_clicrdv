class Intervention < ActiveRecord::Base
  # Associations
  belongs_to :calendars

  # Validations
  validates :name, presence: true
  validates :duration, presence: true, inclusion: 1..60
end
