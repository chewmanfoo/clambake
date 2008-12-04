class CreateBudgetLines < ActiveRecord::Migration
  def self.up
    create_table :budget_lines do |t|
      t.integer :budget_id
      t.integer :debt_id
      t.boolean :paid

      t.timestamps
    end
  end

  def self.down
    drop_table :budget_lines
  end
end
