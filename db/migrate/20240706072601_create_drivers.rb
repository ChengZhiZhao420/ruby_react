class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :driverName
      t.text :authNo
      t.string :licence
      t.datetime :securityCheckIn
      t.datetime :counterCheckIn
      t.string :dockDoor

      t.timestamps
    end
  end
end
