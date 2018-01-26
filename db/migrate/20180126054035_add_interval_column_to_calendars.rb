class AddIntervalColumnToCalendars < ActiveRecord::Migration
  def change
    add_column :calendars, :intervals, :integer
  end
end
