class AddColornumberToWidget < ActiveRecord::Migration[5.2]
  def change
    add_column :widgets, :colornumber, :string, default: '#111111'
  end
end
