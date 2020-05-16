class CreateUserWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_widgets do |t|
      t.integer :user_id
      t.string :widgetable_type
      t.integer :widgetable_id

      t.timestamps
    end
  end
end
