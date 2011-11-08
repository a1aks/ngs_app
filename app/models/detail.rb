class Detail
  attr_reader :things
  
  def initialize
    @things = []
  end
  
  def add_batch(batch)
    @things << batch
  end
end