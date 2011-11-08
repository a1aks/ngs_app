class AddUserIdToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :user_id, :integer
  end

  def self.down
    remove_column :batches, :user_id
  end
end
