class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :calendar_id
      t.integer :intervention_id
      t.datetime :start_at
      t.datetime :end_at
      t.string :customer_name

      t.timestamps null: false
    end
  end
end
