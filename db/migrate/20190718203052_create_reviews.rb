class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body
      t.integer :overall_rating, null: false
      t.integer :noise_rating, null: false
      t.integer :wifi_rating, null: false
      t.integer :capacity_rating, null: false
      t.integer :outlet_rating, null: false
      t.integer :group_max, null: false
      t.belongs_to :user
      t.belongs_to :place

      t.timestamps null: false
    end
  end
end
