class CreateUserRelationship < ActiveRecord::Migration[6.1]
  def change
    create_table :user_relationships do |t|
      t.integer :user_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
