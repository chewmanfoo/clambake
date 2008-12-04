class Debt < ActiveRecord::Base
  validates_presence_of :company_id

  belongs_to :company
  belongs_to :payday  
  belongs_to :debt_type
  has_many :budget_lines
  has_many :budgets, :through => :budget_lines
end
