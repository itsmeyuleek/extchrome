class CreateColorBarWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :color_bar_widgets do |t|
      t.string :color

      t.timestamps
    end
  end
end
