module BatchesHelper
  # Add sample links with an helper method
  def add_sample_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :samples, :partial => 'sample', :object => Sample.new
    end
  end 
end
