class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :api_key
      t.string :secret

      t.timestamps
    end
  end
end
