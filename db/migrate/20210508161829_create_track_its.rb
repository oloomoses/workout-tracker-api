class CreateTrackIts < ActiveRecord::Migration[6.1]
  def change
    create_table :track_its do |t|
      t.date :date
      t.text :description
      t.integer :minutes_recorded
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
