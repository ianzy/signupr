class CreateGuestEvents < ActiveRecord::Migration
  def change
    create_table :guest_events do |t|
      t.integer :guest_id
      t.integer :event_id
      t.string :type
      t.boolean :is_signed_up
      t.boolean :is_checked_in
      t.boolean :is_gift_picked

      t.timestamps
    end
  end
end
