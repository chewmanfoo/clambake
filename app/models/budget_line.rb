class BudgetLine < ActiveRecord::Base
  belongs_to :debt
  belongs_to :budget
end
