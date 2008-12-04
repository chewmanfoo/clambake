class DebtsController < ApplicationController
  before_filter :login_required
  layout "application"

  # GET /debts
  # GET /debts.xml
  def index
    sort = case params['sorter']
      when "name"  then "name"
      when "name_rev"   then "name DESC"
      when "company_id" then "company_id"
      when "company_id_rev"  then "company_id DESC"
      when "payday_id"  then "payday_id"
      when "payday_id_rev"   then "payday_id DESC"
      when "total_due"  then "total_due"
      when "total_due_rev"   then "total_due DESC"
      when "min_due"  then "min_due"
      when "min_due_rev"   then "min_due DESC"
      when "due_day"  then "due_day"
      when "due_day_rev"   then "due_day DESC"
      when "apr"  then "apr"
      when "apr_rev"   then "apr DESC"
    end
    
    conditions = ["name LIKE ?", "%#{params[:query]}%"] unless params[:query].nil?

    @total = Debt.count(:conditions => conditions)
    @debts = Debt.find(:all, :order => sort, :conditions => conditions)

#    if params[:sorter]
#      @debts = Debt.find(:all, :order => params[:sorter])
#    elsif
#      @debts = Debt.find(:all)
#    end
    @goals = Goal.find(:all)
    #  @goals = Goal.find(:all, :conditions => ["user_id = ?", params[:user]])
   
    if request.xml_http_request?
      render :partial => "debts", :layout => false
    end
                    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @debts }
    end
  end

  # GET /debts/1
  # GET /debts/1.xml
  def show
    @debt = Debt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @debt }
    end
  end

  # GET /debts/new
  # GET /debts/new.xml
  def new
    @debt = Debt.new
    @companies = Company.find(:all)
    @paydays = Payday.find(:all)
    @dtypes = DebtType.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @debt }
    end
  end

  # GET /debts/1/edit
  def edit
    @debt = Debt.find(params[:id])
    @companies = Company.find(:all)
    @paydays = Payday.find(:all)
    @dtypes = DebtType.find(:all)
  end

  # POST /debts
  # POST /debts.xml
  def create
    @debt = Debt.new(params[:debt])

    respond_to do |format|
      if @debt.save
        flash[:notice] = 'Debt was successfully created.'
        format.html { redirect_to(@debt) }
        format.xml  { render :xml => @debt, :status => :created, :location => @debt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @debt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /debts/1
  # PUT /debts/1.xml
  def update
    @debt = Debt.find(params[:id])

    respond_to do |format|
      if @debt.update_attributes(params[:debt])
        flash[:notice] = 'Debt was successfully updated.'
        format.html { redirect_to(@debt) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @debt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.xml
  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy

    respond_to do |format|
      format.html { redirect_to(debts_url) }
      format.xml  { head :ok }
    end
  end
end
