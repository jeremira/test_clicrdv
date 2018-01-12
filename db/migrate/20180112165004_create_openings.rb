class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.integer :calendar_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end
