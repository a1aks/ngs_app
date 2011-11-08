class AddMultiplexValueToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :multi_value, :integer
  end

  def self.down
    remove_column :batches, :multi_value
  end
end
