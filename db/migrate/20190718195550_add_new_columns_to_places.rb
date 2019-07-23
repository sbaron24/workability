class AddNewColumnsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :wifi, :boolean, null: false
    add_column :places, :food, :boolean, null: false
    add_column :places, :outdoor_seating, :boolean, null: false
    add_column :places, :standing_options, :boolean, null: false
    add_column :places, :group_capacity, :float, null: false, default: 1
    add_column :places, :overall_workability, :float, null: false, default: 0
    add_column :places, :address, :string, null: false
    add_column :places, :city, :string, null: false
    add_column :places, :state, :string, null: false
    add_column :places, :zip, :string, null: false
    add_column :places, :neighborhood, :string, null: false
  end
end
