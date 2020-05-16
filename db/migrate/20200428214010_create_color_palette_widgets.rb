class CreateColorPaletteWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :color_palette_widgets do |t|
      t.string :color
      t.integer :type

      t.timestamps
    end
  end
end
