class BatchesController < ApplicationController
  #  This simple before_filter helper method allows all the pages to be protected until siging in is done
  before_filter :authenticate, :only => :index
  # GET /batches
  # GET /batches.xml
  def index
    @batches = Batch.all(:order => "created_at DESC")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @batches }
    end
  end

  # GET /batches/1
  # GET /batches/1.xml
  def show
    @batch = Batch.find(params[:id])
   

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @batch }
    end
  end

  # GET /batches/new
  # GET /batches/new.xml
  def new
    @title = "Submit new"        
    # Creating a new instance for a batch
    @batch = Batch.new
    
   
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @batch }
      end
  end

  # GET /batches/1/edit
  def edit
    @batch = Batch.find(params[:id])
  end

  # POST /batches
  # POST /batches.xml
  def create
    @batch = Batch.new(params[:batch])
    # Check if the User is the curerent_user?
    if current_user.id?
      # Put that current_user_id to the Batch.user_id
      @batch.user_id = current_user.id
    end  
    
    respond_to do |format|
      if @batch.save
        flash[:notice] = 'Thank you for submitting the Samples..!'
        format.html { redirect_to(@batch) }
        format.xml  { render :xml => @batch, :status => :created, :location => @batch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @batch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /batches/1
  # PUT /batches/1.xml
  def update
     @batch = Batch.find(params[:id])

     respond_to do |format|
       if @batch.update_attributes(params[:batch])
         flash[:notice] = 'Successfully updated Batch.'
         format.html { redirect_to(@batch) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @batch.errors, :status => :unprocessable_entity }
       end
     end
   end

  # DELETE /batches/1
  # DELETE /batches/1.xml
  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to(batches_url) }
      format.xml  { head :ok }
    end
  end
  
  # Adding sequencing group
  def add_sequence
    @batch = batch.find(params[:id])
  end 
  
  private
  
  def authenticate
    # This method id different from others. also includes admin requirements
     deny_access unless signed_in? && current_user.admin?
   end
  
end
