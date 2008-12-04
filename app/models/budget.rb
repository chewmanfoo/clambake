class Budget < ActiveRecord::Base
  has_many :budget_lines
  has_many :debts, :through => :budget_lines
  belongs_to :payday
  belongs_to :user

  def total_debts_min_due
    (debts.inject(0) {|total, debt| total + debt.min_due})/100
  end
end
