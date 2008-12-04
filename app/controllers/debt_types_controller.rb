class DebtTypesController < ApplicationController
  # GET /debt_types
  # GET /debt_types.xml
  def index
    @debt_types = DebtType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @debt_types }
    end
  end

  # GET /debt_types/1
  # GET /debt_types/1.xml
  def show
    @debt_type = DebtType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @debt_type }
    end
  end

  # GET /debt_types/new
  # GET /debt_types/new.xml
  def new
    @debt_type = DebtType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @debt_type }
    end
  end

  # GET /debt_types/1/edit
  def edit
    @debt_type = DebtType.find(params[:id])
  end

  # POST /debt_types
  # POST /debt_types.xml
  def create
    @debt_type = DebtType.new(params[:debt_type])

    respond_to do |format|
      if @debt_type.save
        flash[:notice] = 'DebtType was successfully created.'
        format.html { redirect_to(@debt_type) }
        format.xml  { render :xml => @debt_type, :status => :created, :location => @debt_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @debt_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /debt_types/1
  # PUT /debt_types/1.xml
  def update
    @debt_type = DebtType.find(params[:id])

    respond_to do |format|
      if @debt_type.update_attributes(params[:debt_type])
        flash[:notice] = 'DebtType was successfully updated.'
        format.html { redirect_to(@debt_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @debt_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /debt_types/1
  # DELETE /debt_types/1.xml
  def destroy
    @debt_type = DebtType.find(params[:id])
    @debt_type.destroy

    respond_to do |format|
      format.html { redirect_to(debt_types_url) }
      format.xml  { head :ok }
    end
  end
end
