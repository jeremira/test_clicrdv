class Opening < ActiveRecord::Base
  include SpaceContinium
  # Association
  belongs_to :calendar

  # Scopes
  scope :overlaping, ->(starting, ending) { where("end_at > ?", starting).where("start_at < ?", ending) }

  # Validations
  validates :calendar_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :end_come_after_start
  validate :does_not_overlap

  private

    def does_not_overlap
      if Opening.overlaping(start_at, end_at).count > 0
        errors.add(:base, 'Your new opening is overlapping a previous one.')
      end
    end

end
