class ChangeColorPaletteColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :color_palette_widgets, :type, :palette_type
  end
end
