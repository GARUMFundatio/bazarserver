class EstdadisticasbazaresController < ApplicationController
  # GET /estdadisticasbazares
  # GET /estdadisticasbazares.xml
  def index
    @estdadisticasbazares = Estdadisticasbazar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estdadisticasbazares }
    end
  end

  # GET /estdadisticasbazares/1
  # GET /estdadisticasbazares/1.xml
  def show
    @estdadisticasbazar = Estdadisticasbazar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estdadisticasbazar }
    end
  end

  # GET /estdadisticasbazares/new
  # GET /estdadisticasbazares/new.xml
  def new
    @estdadisticasbazar = Estdadisticasbazar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estdadisticasbazar }
    end
  end

  # GET /estdadisticasbazares/1/edit
  def edit
    @estdadisticasbazar = Estdadisticasbazar.find(params[:id])
  end

  # POST /estdadisticasbazares
  # POST /estdadisticasbazares.xml
  def create
    @estdadisticasbazar = Estdadisticasbazar.new(params[:estdadisticasbazar])

    respond_to do |format|
      if @estdadisticasbazar.save
        format.html { redirect_to(@estdadisticasbazar, :notice => 'Estdadisticasbazar was successfully created.') }
        format.xml  { render :xml => @estdadisticasbazar, :status => :created, :location => @estdadisticasbazar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estdadisticasbazar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estdadisticasbazares/1
  # PUT /estdadisticasbazares/1.xml
  def update
    @estdadisticasbazar = Estdadisticasbazar.find(params[:id])

    respond_to do |format|
      if @estdadisticasbazar.update_attributes(params[:estdadisticasbazar])
        format.html { redirect_to(@estdadisticasbazar, :notice => 'Estdadisticasbazar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estdadisticasbazar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estdadisticasbazares/1
  # DELETE /estdadisticasbazares/1.xml
  def destroy
    @estdadisticasbazar = Estdadisticasbazar.find(params[:id])
    @estdadisticasbazar.destroy

    respond_to do |format|
      format.html { redirect_to(estdadisticasbazares_url) }
      format.xml  { head :ok }
    end
  end
end
