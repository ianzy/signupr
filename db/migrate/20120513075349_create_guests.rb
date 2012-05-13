class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_cn
      t.string :last_name_cn
      t.string :phone
      t.string :email
      t.text :nate

      t.timestamps
    end
  end
end
