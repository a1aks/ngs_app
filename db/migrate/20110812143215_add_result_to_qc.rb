class AddResultToQc < ActiveRecord::Migration
  def self.up
    add_column :qcs, :result, :string
  end

  def self.down
    remove_column :qcs, :result
  end
end
