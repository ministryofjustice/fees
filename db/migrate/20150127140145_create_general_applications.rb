class CreateGeneralApplications < ActiveRecord::Migration
  def change
    create_table :general_applications do |t|
      t.string :title
      t.integer :fee

      t.timestamps null: false
    end
  end
end
