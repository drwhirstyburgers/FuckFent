class CreateMemoriams < ActiveRecord::Migration[5.1]
  def change
    create_table :memoriams do |t|
      t.string :name
      t.string :image
      t.string :born
      t.string :died
      t.text :obit

      t.timestamps
    end
  end
end
