class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :place_type, null: false
      t.string :location, null: false
      t.text :description, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
