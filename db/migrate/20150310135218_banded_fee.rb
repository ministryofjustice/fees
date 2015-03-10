class BandedFee < ActiveRecord::Migration
  def change
    create_table :banded_fees do |t|
      t.references :fee_type, null: false
      t.string :fee_number, null: false
      t.string :from_amount, null: false
      t.string :to_amount, null: false
      t.string :amount, null: false

      t.timestamps null: false
    end
    add_foreign_key :banded_fees, :fee_types
  end
end
