class DropColorPaletteColorColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :color_palette_widgets, :color
  end
end
