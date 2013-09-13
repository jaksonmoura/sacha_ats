class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.string :name
      t.string :nickname
      t.string :password_digest

      t.timestamps
    end
  end
end
