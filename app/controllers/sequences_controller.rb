class SequencesController < ApplicationController
  before_filter :authenticate, :only => :new
  
  
  def new 
    @batch = Batch.find(params[:id])
    @sequence = @batch.build_sequence
  end
  
  # ADD a Create method for creating the details of each batch in the database 
  def create 
    @batch = Batch.find(params[:id])
    @sequence = @batch.create_sequence(params[:sequence])    
      if @sequence.save
        flash[:notice] = 'Sequence Details Added'
       redirect_to sequence_path(:id =>@batch.id) 
      end
  end      

  def show
    @batch = Batch.find(params[:id])
    @sequence = @batch.sequence(params[:sequence])
  end


  private
  
  def authenticate
    # This method id different from others. also includes admin requirements
     deny_access unless signed_in? && current_user.admin?
   end
end
