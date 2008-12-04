class AddTypeIdToDebts < ActiveRecord::Migration
  def self.up
    add_column :debts, :type_id, :integer
  end

  def self.down
    remove_column :debts, :type_id
  end
end
