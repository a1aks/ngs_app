class AddCollectToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :collect, :string
  end

  def self.down
    remove_column :batches, :collect
  end
end
