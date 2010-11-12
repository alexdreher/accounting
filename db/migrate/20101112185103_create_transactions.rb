class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.date :booking_date
      t.integer :debit_id
      t.integer :credit_id
      t.float :amount
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
