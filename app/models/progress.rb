class Progress
  attr_reader :items
  
  def initialize
    @items = []
  end
  
  def add_batch(batch)
    @items << batch
  end
end