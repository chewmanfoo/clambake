class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
      t.string :name
      t.text :note
      t.integer :payday_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :budgets
  end
end
