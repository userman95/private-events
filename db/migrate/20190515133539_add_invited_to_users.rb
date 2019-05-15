class AddInvitedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :invited, :boolean
  end
end
