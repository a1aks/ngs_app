class AddThingsToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :multiplex, :string
    add_column :batches, :bioinfo, :string
  end

  def self.down
    remove_column :batches, :bioinfo
    remove_column :batches, :multiplex
  end
end
