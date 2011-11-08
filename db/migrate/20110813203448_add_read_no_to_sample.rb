class AddReadNoToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :read_no, :integer
  end

  def self.down
    remove_column :samples, :read_no
  end
end
