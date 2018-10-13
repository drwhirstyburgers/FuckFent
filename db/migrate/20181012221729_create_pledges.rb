class CreatePledges < ActiveRecord::Migration[5.1]
  def change
    create_table :pledges do |t|
      t.string :name
      t.string :email
      t.integer :payment_type
      t.text :notes
      t.boolean :complete
      t.string :amount

      t.timestamps
    end
  end
end
