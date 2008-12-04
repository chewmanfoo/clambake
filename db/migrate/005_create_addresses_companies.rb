class CreateAddressesCompanies < ActiveRecord::Migration
  def self.up
    create_table :addresses_companies do |t|
      t.integer :address_id
      t.integer :company_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses_companies
  end
end
