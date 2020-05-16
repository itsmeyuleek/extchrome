class CreateColorSchemeWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :color_scheme_widgets do |t|

      t.timestamps
    end
  end
end
