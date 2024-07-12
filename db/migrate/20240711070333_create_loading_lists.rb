class CreateLoadingLists < ActiveRecord::Migration[7.1]
  def change
    create_table :loading_lists do |t|
      t.integer :driver
      t.integer :bolno

      t.timestamps
    end
  end
end
