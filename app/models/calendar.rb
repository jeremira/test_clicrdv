class Calendar < ActiveRecord::Base
  # Associations
  has_many :interventions
  has_many :openings

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :intervals, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
