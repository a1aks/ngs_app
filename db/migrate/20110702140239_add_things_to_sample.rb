class AddThingsToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :organism, :string
    add_column :samples, :ini_conc, :decimal
    add_column :samples, :ini_vol, :decimal
    add_column :samples, :samp_comment, :string
  end

  def self.down
    remove_column :samples, :samp_comment
    remove_column :samples, :ini_vol
    remove_column :samples, :ini_conc
    remove_column :samples, :organism
  end
end
