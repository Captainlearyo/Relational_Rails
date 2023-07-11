class CreateMovie < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.integer :length
      t.boolean :in_theaters

      t.timestamps
    end
  end
end
