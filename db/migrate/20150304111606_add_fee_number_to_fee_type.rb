class AddFeeNumberToFeeType < ActiveRecord::Migration
  def change
    add_column :fee_types, :fee_number, :string
  end
end
