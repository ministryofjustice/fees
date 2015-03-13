class RenameFeeTypeToFee < ActiveRecord::Migration
  def change
    rename_table :fee_types, :fees
  end
end
