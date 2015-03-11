class FlatFee < ActiveRecord::Migration
  def change
    create_table :flat_fees do |t|
      t.references :fee_type, null: false
      t.string :fee_number, null: false
      t.string :amount, null: false

      t.timestamps null: false
    end
    add_foreign_key :banded_fees, :fee_types
  end
end
