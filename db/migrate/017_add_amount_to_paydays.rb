class AddAmountToPaydays < ActiveRecord::Migration
  def self.up
    add_column :paydays, :amount, :integer
  end

  def self.down
    remove_column :paydays, :amount
  end
end
