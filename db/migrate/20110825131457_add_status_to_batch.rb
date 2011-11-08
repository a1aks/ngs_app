class AddStatusToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :status, :string
  end

  def self.down
    remove_column :batches, :status
  end
end
