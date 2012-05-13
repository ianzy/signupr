class CreateGuestEventLogs < ActiveRecord::Migration
  def change
    create_table :guest_event_logs do |t|
      t.integer :guest_event_id
      t.string :log_type
      t.text :log_details

      t.timestamps
    end
  end
end
