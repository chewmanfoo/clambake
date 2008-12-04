class AddDebtTypeIdToDebts < ActiveRecord::Migration
  def self.up
    rename_column "debts", "type_id", "debt_type_id"
    drop_table "types"
  end

  def self.down

  end
end
