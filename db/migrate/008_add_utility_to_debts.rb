class AddUtilityToDebts < ActiveRecord::Migration
  def self.up
    add_column :debts, :utility, :boolean
  end

  def self.down
    remove_column :debts, :utility
  end
end
