class RemoveSampNoFromBatch < ActiveRecord::Migration
  def self.up
    remove_column :batches, :samp_no
  end

  def self.down
    add_column :batches, :samp_no, :integer
  end
end
