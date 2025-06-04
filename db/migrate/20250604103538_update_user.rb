class UpdateUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :city, :string
    remove_column :users, :geocoordinates
  end
end
