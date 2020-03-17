class CreateGradientWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :gradient_widgets do |t|
      t.string :start_color
      t.string :end_color

      t.timestamps
    end
  end
end
