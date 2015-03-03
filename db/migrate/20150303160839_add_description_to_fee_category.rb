class AddDescriptionToFeeCategory < ActiveRecord::Migration
  def change
    add_column :fee_categories, :description, :text
  end
end
