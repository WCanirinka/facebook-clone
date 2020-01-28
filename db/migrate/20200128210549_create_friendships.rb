class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.boolean :confirmed
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
