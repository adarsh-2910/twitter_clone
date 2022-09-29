class AddUserIdToTwits < ActiveRecord::Migration[7.0]
  def change
    add_column :twits, :user_id, :integer
  end
end
