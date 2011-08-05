class ClustersController < ApplicationController

  layout "bazar"
  
  def index
    @clusters = Cluster.all.paginate(:page => params[:page], :per_page => 500)

    respond_to do |format|
      if current_user
        format.html # index.html.erb
      else 
        redirect_to '/'
      end 
      format.xml  { render :xml => @clusters }
      format.json { render :json => @clusters }
    end
  end

  def show
    @cluster = Cluster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cluster }
    end
  end

  def show2
    @cluster = Cluster.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
    end
  end
  

  def new
    @cluster = Cluster.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml =>  @cluster }
    end
  end

  def edit
    if current_user 
      @cluster = Cluster.find(params[:id])
    end 
  end

  def create
    
    if current_user 
      @cluster = Cluster.new(params[:cluster])
    end 
    
    respond_to do |format|
      if @cluster.save
        format.html { redirect_to(clusters_url, :notice => 'Cluster was successfully created.') }
        format.xml  { render :xml => @cluster, :status => :created, :location => @cluster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cluster.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    if current_user
      @cluster = Cluster.find(params[:id])
    end 
    respond_to do |format|
      if @cluster.update_attributes(params[:cluster])
        format.html { redirect_to(clusters_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cluster.errors, :status => :unprocessable_entity }
      end
    end
  end

  def activar 
      @cluster = Cluster.find(params[:id])
      @cluster.activo = "S"
      @cluster.save
      puts "Activado el cluster #{params[:id]}"
      respond_to do |format|
        format.html { redirect_to(clusters_url) }
        format.xml  { head :ok }
      end
  end
  
  def destroy
    if current_user 
      @cluster = Cluster.find(params[:id])
      @cluster.activo = "N"
      @cluster.save
    end 
    
    respond_to do |format|
      format.html { redirect_to(clusters_url) }
      format.xml  { head :ok }
    end
  end
  
end
