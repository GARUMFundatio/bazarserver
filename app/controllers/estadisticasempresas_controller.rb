class EstadisticasempresasController < ApplicationController
  # GET /estadisticasempresas
  # GET /estadisticasempresas.xml
  def index
    @estadisticasempresas = Estadisticasempresa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estadisticasempresas }
    end
  end

  # GET /estadisticasempresas/1
  # GET /estadisticasempresas/1.xml
  def show
    @estadisticasempresa = Estadisticasempresa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estadisticasempresa }
    end
  end

  # GET /estadisticasempresas/new
  # GET /estadisticasempresas/new.xml
  def new
    @estadisticasempresa = Estadisticasempresa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estadisticasempresa }
    end
  end

  # GET /estadisticasempresas/1/edit
  def edit
    @estadisticasempresa = Estadisticasempresa.find(params[:id])
  end

  # POST /estadisticasempresas
  # POST /estadisticasempresas.xml
  def create
    @estadisticasempresa = Estadisticasempresa.new(params[:estadisticasempresa])

    respond_to do |format|
      if @estadisticasempresa.save
        format.html { redirect_to(@estadisticasempresa, :notice => 'Estadisticasempresa was successfully created.') }
        format.xml  { render :xml => @estadisticasempresa, :status => :created, :location => @estadisticasempresa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estadisticasempresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estadisticasempresas/1
  # PUT /estadisticasempresas/1.xml
  def update
    @estadisticasempresa = Estadisticasempresa.find(params[:id])

    respond_to do |format|
      if @estadisticasempresa.update_attributes(params[:estadisticasempresa])
        format.html { redirect_to(@estadisticasempresa, :notice => 'Estadisticasempresa was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estadisticasempresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estadisticasempresas/1
  # DELETE /estadisticasempresas/1.xml
  def destroy
    @estadisticasempresa = Estadisticasempresa.find(params[:id])
    @estadisticasempresa.destroy

    respond_to do |format|
      format.html { redirect_to(estadisticasempresas_url) }
      format.xml  { head :ok }
    end
  end
end
