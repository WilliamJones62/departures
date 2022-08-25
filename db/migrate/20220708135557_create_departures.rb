class CreateDepartures < ActiveRecord::Migration[7.0]
  def change
    create_table :departures do |t|
      t.string :door
      t.string :truck
      t.string :route
      t.string :loader
      t.string :driver
      t.boolean :loaded
      t.datetime :loaded_time
      t.boolean :confirmed
      t.datetime :confirmed_time

      t.timestamps
    end
  end
end
