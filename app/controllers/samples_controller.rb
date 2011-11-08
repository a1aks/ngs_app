class SamplesController < ApplicationController
  # Before_filter method
   before_filter :authenticate, :only => :index
  def index    
    # Try changing this though, due to SQL injection reasons, This is not good Ruby Programming practise....:(
    @bat_samp = Batch.find_by_sql("SELECT Samples.*, Batches.id as bid, Batches.sample_type 
                                   FROM Batches, Samples
                                   WHERE bid = Samples.batch_id 
                                   ORDER BY Batches.sample_type ") 
   
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @samples }
    end
  end
  
  # DELETE /samples/1
  # DELETE /samples/1.xml
  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to(samples_url) }
      format.xml  { head :ok }
    end
  end  
  
  def add_qcs
    @samples = Sample.find(params[:bat_samp_ids])  
  end 
  
  def create_qc
    @samples = Sample.update(params[:samples].keys, params[:samples].values).reject { |p| p.errors.empty? }
    if @samples.empty?
    flash[:notice] = "Qc Added"    
    redirect_to show_qc_passed_samples_path
  else 
    render :action => "add_qcs"
  end
  end  
  
  def show_qc_passed
     @bat_samp = Batch.find_by_sql("SELECT Samples.*, Batches.id as bid, Batches.preparation 
                                     FROM Batches, Samples
                                     WHERE bid = Samples.batch_id 
                                     ORDER BY Batches.preparation") 
  end
  
  def add_library
    @sample_lib = Sample.find(params[:bat_samp_ids])  
  end
  
  def create_library
      @samples = Sample.update(params[:samples].keys, params[:samples].values).reject { |p| p.errors.empty? }
    if @samples.empty?
      flash[:notice] = "Library Added"

      redirect_to show_lib_passed_samples_path
    else
      render :action => "add_library"
    end
  end
  
  def show_lib_passed
    @bat_samp = Batch.find_by_sql("SELECT Samples.*, Batches.id as bid, Batches.preparation 
                                     FROM Batches, Samples
                                     WHERE bid = Samples.batch_id 
                                     ORDER BY Batches.preparation") 
    
  end
  
  def add_run
      @sample_run = Sample.find(params[:bat_samp_ids])  
  end
  
  def create_run
    @samples = Sample.update(params[:samples].keys, params[:samples].values).reject { |p| p.errors.empty? }
     if @samples.empty?
        flash[:notice] = "Run Added"

        redirect_to show_run_passed_samples_path
      else
        render :action => "add_run"
      end
  end
  
  def show_run_passed
    @bat_samp = Batch.find_by_sql("SELECT Samples.*, Batches.id as bid, Batches.preparation 
                                     FROM Batches, Samples
                                     WHERE bid = Samples.batch_id 
                                     ORDER BY Batches.preparation")
  end
  
  private
  def authenticate
    # This method id different from others. also includes admin requirements
     deny_access unless signed_in? && current_user.admin?
   end
end
