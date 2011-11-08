class AddMajorToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :submit_date, :date
    add_column :batches, :grp_leader, :string
    add_column :batches, :contact_person, :string
    add_column :batches, :batch_comment, :text
  end

  def self.down
    remove_column :batches, :batch_comment
    remove_column :batches, :contact_person
    remove_column :batches, :grp_leader
    remove_column :batches, :submit_date
  end
end
