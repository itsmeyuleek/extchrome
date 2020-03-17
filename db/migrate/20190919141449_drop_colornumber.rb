class DropColornumber < ActiveRecord::Migration[5.2]
  def change
    remove_column :widgets, :colornumber, :string
  end
end
