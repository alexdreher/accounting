class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :parent_id
      t.integer :number
      t.integer :account_type_id
      t.string :title
      t.boolean :bookable

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
