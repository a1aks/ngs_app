class Batch < ActiveRecord::Base
  
  def self.find_batches_to_show
    find(:all, :order =>"submit_date" )
  end
  
  has_many :samples
  after_update :save_samples
  validates_associated :samples
  
  # a method that updates the sample attributes to the database which is displayed in the show.html after the edit.html
  def sample_attributes=(sample_attributes)
    sample_attributes.each do |attributes|
      if attributes[:id].blank?
      samples.build(attributes)
    else
      sample = samples.detect { |samp| samp.id == attributes[:id].to_i }
      sample.attributes = attributes
    end
    end
  end  
  
  # Method that saves the samples when removed, editted or added, For this just loop through each samples and if 
  #it has to be removed it destroys else it saves the new edited field
  def save_samples
    samples.each do |s|
      if s.should_destroy?
        s.destroy
      else
      s.save(false)
    end
    end
  end  
end
