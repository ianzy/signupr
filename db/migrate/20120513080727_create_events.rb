class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :start_time
      t.datetime :end_time
      t.string :organizer_name
      t.text :note

      t.timestamps
    end
  end
end
