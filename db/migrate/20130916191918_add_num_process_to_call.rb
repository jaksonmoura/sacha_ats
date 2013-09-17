class AddNumProcessToCall < ActiveRecord::Migration
  def change
    add_column :calls, :numprocess, :integer
  end
end
