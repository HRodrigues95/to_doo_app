# This migration should've been merged with the previous one
# However, NEVER run a migration and then update its code.
# To undo a migration and update its code, run
# `rails db:rollback STEP=<#migration_to_rollback>` (STEP defaults to 1)
class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
  end
end
