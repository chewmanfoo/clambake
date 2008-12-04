class PaydaysController < ApplicationController
  before_filter :login_required
  layout "application"

  # GET /paydays
  # GET /paydays.xml
  def index
    @paydays = Payday.find(:all, :order => :due_date)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paydays }
    end
  end

  # GET /paydays/1
  # GET /paydays/1.xml
  def show
    @payday = Payday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payday }
    end
  end

  # GET /paydays/new
  # GET /paydays/new.xml
  def new
    @payday = Payday.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payday }
    end
  end

  # GET /paydays/1/edit
  def edit
    @payday = Payday.find(params[:id])
  end

  # POST /paydays
  # POST /paydays.xml
  def create
    @payday = Payday.new(params[:payday])

    respond_to do |format|
      if @payday.save
        flash[:notice] = 'Payday was successfully created.'
        format.html { redirect_to(@payday) }
        format.xml  { render :xml => @payday, :status => :created, :location => @payday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paydays/1
  # PUT /paydays/1.xml
  def update
    @payday = Payday.find(params[:id])

    respond_to do |format|
      if @payday.update_attributes(params[:payday])
        flash[:notice] = 'Payday was successfully updated.'
        format.html { redirect_to(@payday) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paydays/1
  # DELETE /paydays/1.xml
  def destroy
    @payday = Payday.find(params[:id])
    @payday.destroy

    respond_to do |format|
      format.html { redirect_to(paydays_url) }
      format.xml  { head :ok }
    end
  end
end
