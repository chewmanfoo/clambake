class CreatePaydays < ActiveRecord::Migration
  def self.up
    create_table :paydays do |t|
      t.string :name
      t.date :due_date
      t.text :note
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :paydays
  end
end
