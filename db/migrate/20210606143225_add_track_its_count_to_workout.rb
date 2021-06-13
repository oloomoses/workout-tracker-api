class AddTrackItsCountToWorkout < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :track_its_count, :integer, default: 0, null: false

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
      UPDATE workouts
        SET track_its_count = (SELECT count(1)
                              FROM track_its
                              WHERE track_its.workout_id = workouts.id)
    SQL
  end
end
