class AddSlugToGeneralApplication < ActiveRecord::Migration
  def change
    add_column :general_applications, :slug, :string, null: false
    add_index :general_applications, :slug, unique: true
  end
end
