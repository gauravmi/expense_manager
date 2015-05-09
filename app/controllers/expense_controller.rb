class ExpenseController < ApplicationController
  def new
  end

  def list_all
    expenses = Expense.all
  end
end
