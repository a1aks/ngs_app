class AddThirdToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :preparation, :string
    add_column :batches, :sequencing, :string
  end

  def self.down
    remove_column :batches, :sequencing
    remove_column :batches, :preparation
  end
end
