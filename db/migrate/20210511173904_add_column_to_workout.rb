class AddColumnToWorkout < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :created_by, :integer
  end
end
