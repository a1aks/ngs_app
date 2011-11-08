class AddLibCommentsToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :lib_comment, :text
  end

  def self.down
    remove_column :samples, :lib_comment
  end
end
