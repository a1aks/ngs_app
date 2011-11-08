class AddBidToSequence < ActiveRecord::Migration
  def self.up
    add_column :sequences, :batch_id, :integer
  end

  def self.down
    remove_column :sequences, :batch_id
  end
end
