class AddDisabledToUserWidget < ActiveRecord::Migration[5.2]
  def change
    add_column :user_widgets, :disabled, :boolean
  end
end
