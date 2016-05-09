class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.references :creator,index: true, foreign_key: true
      t.datetime :date
      t.string :cost
      t.references :venue, index: true, foreign_key: true
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end
