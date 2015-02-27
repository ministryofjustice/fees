class CreateStatutoryInstruments < ActiveRecord::Migration
  def change
    create_table :statutory_instruments do |t|
      t.string :title
      t.text :description
      t.date :coming_into_force

      t.timestamps null: false
    end
  end
end
