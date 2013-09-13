class AddAdminToTechnicals < ActiveRecord::Migration
  def change
    add_column :technicals, :admin, :boolean, :default => false, :null => false
  end
end
