class AddDateToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :date, :string
  end
end
