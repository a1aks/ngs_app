class AddQcToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :conc, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :ratio1, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :ratio2, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :agilent, :decimal, :precision => 4, :scale => 1, :default => 0
    add_column :samples, :qubit, :decimal, :precision => 4, :scale => 3, :default => 0
    add_column :samples, :result, :string
  end

  def self.down
    remove_column :samples, :result
    remove_column :samples, :qubit
    remove_column :samples, :agilent
    remove_column :samples, :ratio2
    remove_column :samples, :ratio1
    remove_column :samples, :conc
  end
end
