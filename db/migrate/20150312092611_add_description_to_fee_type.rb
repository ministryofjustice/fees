class AddDescriptionToFeeType < ActiveRecord::Migration
  def change
    add_column :fee_types, :description, :string
  end
end
