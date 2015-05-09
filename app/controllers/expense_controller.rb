class ExpenseController < ApplicationController
  def new
  end
  
  def create
  end
  
  def list_all
    @per_day_expenses_grouped_by_month = Expense.list_all
  end

end
