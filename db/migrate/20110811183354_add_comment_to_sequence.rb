class AddCommentToSequence < ActiveRecord::Migration
  def self.up
    add_column :sequences, :comments, :text
  end

  def self.down
    remove_column :sequences, :comments
  end
end
