class CreateDebtTypes < ActiveRecord::Migration
  def self.up
    create_table :debt_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :debt_types
  end
end
