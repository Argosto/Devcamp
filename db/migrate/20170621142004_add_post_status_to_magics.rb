class AddPostStatusToMagics < ActiveRecord::Migration[5.0]
  def change
    add_column :magics, :status, :integer, default: 0
  end
end
