class AddSlugToFeeCategories < ActiveRecord::Migration
  def change
    add_column :fee_categories, :slug, :string
    add_index :fee_categories, :slug, unique: true
  end
end
