class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :name,                 null: false
      t.string :bank_name,            null: false
      t.string :branch_name
      t.string :ifsc_code
      t.string :account_no,           null: false
      t.references :vendor, index: true, foreign_key: true
      t.boolean :is_active,            null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
