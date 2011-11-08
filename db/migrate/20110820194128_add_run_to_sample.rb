class AddRunToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :run_date, :date
    add_column :samples, :flow_cell, :string
    add_column :samples, :lane, :string
    add_column :samples, :pm, :decimal,  :precision => 4, :scale => 3, :default => 0
    add_column :samples, :run_comments, :text
  end

  def self.down
    remove_column :samples, :run_comments
    remove_column :samples, :pm
    remove_column :samples, :lane
    remove_column :samples, :flow_cell
    remove_column :samples, :run_date
  end
end
