class Calendar < ActiveRecord::Base
  # Associations
  has_many :interventions
  has_many :openings

  # Validations
  validates :name, presence: true, uniqueness: true
end
