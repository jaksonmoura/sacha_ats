class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service
      t.integer :priority

      t.timestamps
    end
  end
end
