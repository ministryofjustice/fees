class RemoveAmountFromFeeType < ActiveRecord::Migration
  def change
    remove_column :fee_types, :amount
  end
end
