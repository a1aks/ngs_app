class AddSecondToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :sample_type, :string
    add_column :batches, :extraction, :string
    add_column :batches, :cleanup, :string
    add_column :batches, :suspension, :string
  end

  def self.down
    remove_column :batches, :suspension
    remove_column :batches, :cleanup
    remove_column :batches, :extraction
    remove_column :batches, :sample_type
  end
end
