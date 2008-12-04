module DebtsHelper
  def display_debt(debt, locals = {})
    # locals.reverse_merge! merges two hashes, with the second taking
    # precedence over the first (so you can set defaults)
    # locals.reverse_merge! :local_var => '...'
    render :partial => debt, :locals => locals
  end

  def total_due_out(debt)
    if debt.total_due.nil? 
      0
    else
      debt.total_due/100
    end
  end
  
  def min_due_out(debt)
    if debt.min_due.nil? 
      0
    else
      debt.min_due/100
    end
  end
end
