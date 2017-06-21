class AddSlugToMagics < ActiveRecord::Migration[5.0]
  def change
    add_column :magics, :slug, :string
    add_index :magics, :slug, unique: true
  end
end
