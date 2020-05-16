class DropColorPaletteColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :color_palette_widgets, :palette_type
  end
end
