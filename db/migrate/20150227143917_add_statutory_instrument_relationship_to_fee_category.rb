class AddStatutoryInstrumentRelationshipToFeeCategory < ActiveRecord::Migration
  def change
    add_column :fee_categories, :statutory_instrument_id, :integer
    change_column_null :fee_categories, :statutory_instrument_id, false
  end
end
