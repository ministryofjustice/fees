class CreateFeeCategories < ActiveRecord::Migration
  def change
    create_table :fee_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
