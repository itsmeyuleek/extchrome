class CreateColorBarLibraryWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :color_bar_library_widgets do |t|
      t.integer :color_position
      t.string :color

      t.timestamps
    end
  end
end
