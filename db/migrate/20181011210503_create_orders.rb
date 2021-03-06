class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.integer :order_type
      t.string :address
      t.text :notes
      t.boolean :complete

      t.timestamps
    end
  end
end
