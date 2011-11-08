class AddLibQcToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :lib_qc_result, :string
  end

  def self.down
    remove_column :samples, :lib_qc_result
  end
end
