module BudgetsHelper
  def add_debt_link(name)
    link_to_function name do |page|
      # Generates: Element.insert("debts_id", { bottom: "*contents of debt partial*" });
      page.insert_html :bottom, 'debts_id', :partial => 'debt'
      page.visual_effect :highlight, 'debts_id', :duration => 3
    end
  end
  
  def total_min_due(budget)
    style = budget.total_debts_min_due > budget.payday.amount_out ? 'color: red' : 'color: black'
    %(<span style="#{style}">#{number_to_currency(budget.total_debts_min_due)}</span>)
  end
end
