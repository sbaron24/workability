class DeleteLocationColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :places, :location
  end

  def down
    add_column :places, :location, :string, null: false
  end
end
