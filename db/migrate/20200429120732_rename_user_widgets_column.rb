class RenameUserWidgetsColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_widgets, :disabled, :hidden
  end
end
