class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :transactions, :id
    add_index :accounts, :id
  end

  def self.down
    remove_index :accounts, :id
    remove_index :transactions, :id
  end
end