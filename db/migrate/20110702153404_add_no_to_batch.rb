class AddNoToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :samp_no, :integer
  end

  def self.down
    remove_column :batches, :samp_no
  end
end
