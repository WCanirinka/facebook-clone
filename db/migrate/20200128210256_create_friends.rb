class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :requester_id
      t.integer :requestee_id
      t.boolean :friendship_status, default: false

      t.timestamps
    end
  end
end
