class CreateQcs < ActiveRecord::Migration
  def self.up
    create_table :qcs do |t|
      t.integer :sample_id
      t.decimal :conc, :precision => 4, :scale => 3, :default => 0
      t.decimal :ratio1, :precision => 4, :scale => 3, :default => 0
      t.decimal :ratio2, :precision => 4, :scale => 3, :default => 0
      t.decimal :agilent, :precision => 4, :scale => 1, :default => 0
      t.decimal :qubit, :precision => 4, :scale => 3, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :qcs
  end
end
