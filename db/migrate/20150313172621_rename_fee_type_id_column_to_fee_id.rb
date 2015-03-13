class RenameFeeTypeIdColumnToFeeId < ActiveRecord::Migration
  def change
    rename_column :banded_fees, :fee_type_id, :fee_id
    rename_column :flat_fees,   :fee_type_id, :fee_id
  end
end
