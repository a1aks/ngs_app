class LabController < ApplicationController
  def index
    @batches = Batch.find_batches_to_show
  end
  
  def view_progress
    batch = Batch.find(params[:id])
    @progress = find_progress
    @progress.add_batch(batch)
  end
  
  def samp_detail
    batch = Batch.find(params[:id])
    @detail = find_detail
    @detail.add_batch(batch)
  end
  
  
  private 
  #Assignming new progress object to the session for the first time as well as the same time
  def find_progress
    session[:progress] ||= Progress.new
  end
  
  def find_detail
    session[:detail] ||= Detail.new
  end
end
