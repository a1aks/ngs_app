class AddMoreLibToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :prepared, :date
    add_column :samples, :lib_qubit, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :lib_agilent, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :lib_conc, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :lib_result, :string
  end

  def self.down
    remove_column :samples, :lib_result
    remove_column :samples, :lib_conc
    remove_column :samples, :lib_agilent
    remove_column :samples, :lib_qubit
    remove_column :samples, :prepared
  end
end
