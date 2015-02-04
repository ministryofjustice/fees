class CreateFeeTypes < ActiveRecord::Migration
  def change
    create_table :fee_types do |t|
      t.references :fee_category, index: true, null: false
      t.string :title
      t.integer :amount

      t.timestamps null: false
    end
    add_foreign_key :fee_types, :fee_categories
  end
end
