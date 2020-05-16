class ChangeDisabledUserWidget < ActiveRecord::Migration[5.2]
  def change
    change_column :user_widgets, :disabled, :boolean, :default => false
  end
end
