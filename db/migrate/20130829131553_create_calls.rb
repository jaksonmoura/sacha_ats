class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :dpto_id
      t.integer :servant_id
      t.integer :technical_id
      t.integer :service_id
      t.text    :problem
      t.string  :service, :null => true
      t.string  :obs, :null => true
      t.boolean :closed, :default => false 

      t.timestamps
    end
  end
end