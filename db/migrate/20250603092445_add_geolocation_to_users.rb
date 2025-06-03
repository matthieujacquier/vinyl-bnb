class AddGeolocationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users,  :geocoordinates, :string
  end
end
