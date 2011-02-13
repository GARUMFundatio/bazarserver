class EstadisticasconsultasController < ApplicationController
  # GET /estadisticasconsultas
  # GET /estadisticasconsultas.xml
  def index
    @estadisticasconsultas = Estadisticasconsulta.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estadisticasconsultas }
    end
  end

  # GET /estadisticasconsultas/1
  # GET /estadisticasconsultas/1.xml
  def show
    @estadisticasconsulta = Estadisticasconsulta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estadisticasconsulta }
    end
  end

  # GET /estadisticasconsultas/new
  # GET /estadisticasconsultas/new.xml
  def new
    @estadisticasconsulta = Estadisticasconsulta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estadisticasconsulta }
    end
  end

  # GET /estadisticasconsultas/1/edit
  def edit
    @estadisticasconsulta = Estadisticasconsulta.find(params[:id])
  end

  # POST /estadisticasconsultas
  # POST /estadisticasconsultas.xml
  def create
    @estadisticasconsulta = Estadisticasconsulta.new(params[:estadisticasconsulta])

    respond_to do |format|
      if @estadisticasconsulta.save
        format.html { redirect_to(@estadisticasconsulta, :notice => 'Estadisticasconsulta was successfully created.') }
        format.xml  { render :xml => @estadisticasconsulta, :status => :created, :location => @estadisticasconsulta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estadisticasconsulta.errors, :status => :unprocessable_entity }
      end
    end
  end

  def grabaconsulta
    @esta = Estadisticasconsulta.new()
    
    @esta.fecha = DateTime::now
    @esta.bazar_id = params[:cid]
    @esta.consulta = CGI.unescape(params[:q])+"|"
    @esta.consulta += CGI.unescape(params[:qe])+"|"
    @esta.consulta += CGI.unescape(params[:qv])+"|"
    @esta.consulta += CGI.unescape(params[:qc])+"|"
    @esta.consulta += CGI.unescape(params[:qr])+"|"
    @esta.consulta += CGI.unescape(params[:bid])
    
    @esta.save

  end

  # PUT /estadisticasconsultas/1
  # PUT /estadisticasconsultas/1.xml
  def update
    @estadisticasconsulta = Estadisticasconsulta.find(params[:id])

    respond_to do |format|
      if @estadisticasconsulta.update_attributes(params[:estadisticasconsulta])
        format.html { redirect_to(@estadisticasconsulta, :notice => 'Estadisticasconsulta was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estadisticasconsulta.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /estadisticasconsultas/1
  # DELETE /estadisticasconsultas/1.xml
  def destroy
    @estadisticasconsulta = Estadisticasconsulta.find(params[:id])
    @estadisticasconsulta.destroy

    respond_to do |format|
      format.html { redirect_to(estadisticasconsultas_url) }
      format.xml  { head :ok }
    end
  end
end
