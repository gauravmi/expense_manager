class ExpenseController < ApplicationController
  def new
  end

  def list_all
    expenses = Expense.all
    p expenses
  end

end
