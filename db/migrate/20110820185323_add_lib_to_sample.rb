class AddLibToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :kapa, :decimal, :precision => 4, :scale => 3, :default => 0
  end

  def self.down
    remove_column :samples, :kapa
  end
end
