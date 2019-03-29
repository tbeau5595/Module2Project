class CreateUserRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rewards do |t|
      t.belongs_to :user
      t.belongs_to :reward
      t.boolean :used, default: false
      
      t.timestamps
    end
  end
end
