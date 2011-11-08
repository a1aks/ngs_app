class AddRunResultToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :result_run, :string
  end

  def self.down
    remove_column :samples, :result_run
  end
end
