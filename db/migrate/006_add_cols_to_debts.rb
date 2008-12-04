class AddColsToDebts < ActiveRecord::Migration
  def self.up
    add_column :debts, :total_due, :integer
    add_column :debts, :min_due, :integer
    add_column :debts, :due_day, :integer
    add_column :debts, :apr, :float
  end

  def self.down
    remove_column :debts, :apr
    remove_column :debts, :due_day
    remove_column :debts, :min_due
    remove_column :debts, :total_due
  end
end
