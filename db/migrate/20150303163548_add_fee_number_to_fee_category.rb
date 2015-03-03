class AddFeeNumberToFeeCategory < ActiveRecord::Migration
  def change
    add_column :fee_categories, :fee_number, :string
  end
end
