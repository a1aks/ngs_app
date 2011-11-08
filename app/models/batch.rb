class Batch < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :samples
  has_one :sequence
  
  # Helper Methods
  after_update :save_samples
  
  # Validations
  validates_associated :samples
       
  # Main Validations for Batch details 
    validates_presence_of(:name, :grp_leader, :contact_person, :extraction, :cleanup, :suspension)
    validates_uniqueness_of :name
    
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
