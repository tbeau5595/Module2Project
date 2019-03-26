class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.belongs_to :user
      t.belongs_to :charity
      t.integer :amount

      t.timestamps
    end
  end
end
