class Calendar < ActiveRecord::Base
  # Associations
  has_many :interventions

  # Validations
  validates :name, presence: true, uniqueness: true
end
