class AddHideShowColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :associations, :hidden, :boolean, default: false
    add_column :color_bar_widgets, :hidden, :boolean, default: false
    add_column :color_palette_widgets, :hidden, :boolean, default: false
    add_column :gradient_widgets, :hidden, :boolean, default: false
  end
end
