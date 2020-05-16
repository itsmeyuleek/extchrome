class AddColorPaletteColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :color_palette_widgets, :selected_scheme, :string, default: 'Analogous'
  end
end
