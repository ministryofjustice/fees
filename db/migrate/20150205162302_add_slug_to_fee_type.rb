class AddSlugToFeeType < ActiveRecord::Migration
  def change
    add_column :fee_types, :slug, :string
    add_index :fee_types, :slug, unique: true
  end
end
