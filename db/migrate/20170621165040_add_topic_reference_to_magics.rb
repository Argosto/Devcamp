class AddTopicReferenceToMagics < ActiveRecord::Migration[5.0]
  def change
    add_reference :magics, :topic, foreign_key: true
  end
end
