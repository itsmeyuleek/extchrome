class DropWidget < ActiveRecord::Migration[5.2]
  def up
    drop_table :widgets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
