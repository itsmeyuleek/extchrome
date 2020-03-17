class CreateAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :associations do |t|
      t.string :words
      t.string :input_word

      t.timestamps
    end
  end
end
