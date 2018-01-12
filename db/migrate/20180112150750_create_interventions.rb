class CreateInterventions < ActiveRecord::Migration
  def change
    create_table :interventions do |t|
      t.string :name
      t.integer :duration
      t.integer :price
      t.integer :calendar_id

      t.timestamps null: false
    end
  end
end
