class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :guests, :nate, :note
  end

  def down
  end
end
