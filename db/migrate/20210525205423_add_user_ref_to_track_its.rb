class AddUserRefToTrackIts < ActiveRecord::Migration[6.1]
  def change
    add_reference :track_its, :user, null: false, foreign_key: true
  end
end
