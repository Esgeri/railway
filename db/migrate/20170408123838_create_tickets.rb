class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :number
      t.string :passenger_name
      t.string :passport_number
      t.references :user, foreighn_key: true
      t.references :train, foreighn_key: true
      t.references :start_station, foreighn_key: { to_table: :railway_stations }
      t.references :end_station, foreighn_key: { to_table: :railway_stations }

      t.timestamps
    end
  end
end
