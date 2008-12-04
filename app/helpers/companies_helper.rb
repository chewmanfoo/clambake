module CompaniesHelper

  def total_owed(company_id)
    sum = Debt.sum('total_due', :conditions => [ 'company_id = ?', company_id ])
    if sum
      sum /100
    elsif
      0
    end
  end

end
