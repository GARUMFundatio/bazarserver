class EstadisticasbazaresController < ApplicationController
  # GET /estadisticasbazares
  # GET /estadisticasbazares.xml
  def index
    @estadisticasbazares = Estadisticasbazar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estadisticasbazares }
    end
  end

  # GET /estadisticasbazares/1
  # GET /estadisticasbazares/1.xml
  def show
    @estadisticasbazar = Estadisticasbazar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estadisticasbazar }
    end
  end

  # GET /estadisticasbazares/new
  # GET /estadisticasbazares/new.xml
  def new
    @estadisticasbazar = Estadisticasbazar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estadisticasbazar }
    end
  end

  # GET /estadisticasbazares/1/edit
  def edit
    @estadisticasbazar = Estadisticasbazar.find(params[:id])
  end

  # POST /estadisticasbazares
  # POST /estadisticasbazares.xml
  def create
    @estadisticasbazar = Estadisticasbazar.new(params[:estadisticasbazar])

    respond_to do |format|
      if @estadisticasbazar.save
        format.html { redirect_to(@estadisticasbazar, :notice => 'Estadisticasbazar was successfully created.') }
        format.xml  { render :xml => @estadisticasbazar, :status => :created, :location => @estadisticasbazar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estadisticasbazar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estadisticasbazares/1
  # PUT /estadisticasbazares/1.xml
  def update
    @estadisticasbazar = Estadisticasbazar.find(params[:id])

    respond_to do |format|
      if @estadisticasbazar.update_attributes(params[:estadisticasbazar])
        format.html { redirect_to(@estadisticasbazar, :notice => 'Estadisticasbazar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estadisticasbazar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estadisticasbazares/1
  # DELETE /estadisticasbazares/1.xml
  def destroy
    @estadisticasbazar = Estadisticasbazar.find(params[:id])
    @estadisticasbazar.destroy

    respond_to do |format|
      format.html { redirect_to(estadisticasbazares_url) }
      format.xml  { head :ok }
    end
  end
end
