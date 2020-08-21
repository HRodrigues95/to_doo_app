# This could've been added on the create_users migration
# t.string :email, null: false, index: { unique: true }
class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
  end
end
