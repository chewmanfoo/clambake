class AddUnguessableCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :unguessable_code, :string
  end

  def self.down
    remove_column :users, :unguessable_code
  end
end
