class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :title
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
