class AlterColorLibraryColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :color_bar_library_widgets, :color, :string, array: true, default: []
  end
end
