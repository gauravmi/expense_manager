class ExpenseController < ApplicationController
  def new
  end
  
  def create
  end
  
  def list_all
    @per_day_expenses_list = Expense.list_all
  end

end
