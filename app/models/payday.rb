class Payday < ActiveRecord::Base
  has_many :debts
  validates_presence_of :name, :due_date
  validates_uniqueness_of :name

  def amount_out
    amount/100
  end
end
