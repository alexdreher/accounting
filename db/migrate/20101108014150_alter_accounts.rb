class AlterAccounts < ActiveRecord::Migration
  def self.up
    change_column(:accounts, :bookable, :integer, :default => true)
  end

  def self.down
    change_column(:accounts, :bookable, :integer)
  end
end
