class Sample < ActiveRecord::Base
  belongs_to :batch
  has_many :qcs
  attr_accessor :should_destroy
  
  # Validations
  validates_presence_of :name, :organism, :ini_conc, :ini_vol
  validates_format_of :ini_conc,:ini_vol,
                          :with => /\d{0,3}\.\d{2}/, 
                          :message => "'must be having decimal values of precision = 3 and scale = 2'"

  def should_destroy?
    should_destroy.to_i == 1
  end
  
  # Getter method that gets the time in the required format
  def prepared_on
    prepared
  end
  
  # Setter method that sets the time to the required format that the user gives 
  def prepared_on=(prepared_at)
    self.prepared = Time.parse(prepared_at)
  end
  
  
  # Getter method that gets the time in the required format
   def run_date_string
     run_date
   end

   # Setter method that sets the time to the required format that the user gives 
   def run_date_string=(run_date_str)
     self.run_date = Time.parse(run_date_str)
   end
end
