class RenameColumnInTableName < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :type, :property_type
  end
end
