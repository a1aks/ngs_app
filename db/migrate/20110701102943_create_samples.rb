class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.integer :batch_id
      t.string :name
      t.string :organism
      t.string :samp_type
      t.decimal :ini_conc, :precision => 4, :scale => 2, :default => 0
      t.decimal :ini_vol, :precision => 4, :scale => 2, :default => 0      
      t.text :samp_comment
      

      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end
