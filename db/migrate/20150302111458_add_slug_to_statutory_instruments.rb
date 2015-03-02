class AddSlugToStatutoryInstruments < ActiveRecord::Migration
  def change
    add_column :statutory_instruments, :slug, :string
  end
end
