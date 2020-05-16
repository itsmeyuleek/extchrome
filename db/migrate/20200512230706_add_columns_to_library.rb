class AddColumnsToLibrary < ActiveRecord::Migration[5.2]
  def change
    add_column :color_bar_library_widgets, :gradients, :json, array: true, default: []
    add_column :color_bar_library_widgets, :palettes, :json, array: true, default: []
  end
end
