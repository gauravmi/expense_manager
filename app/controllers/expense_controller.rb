class ExpenseController < ApplicationController
  def new
  end
  
  def create
	@expense = Expense.new(expense_params)
	if @expense.save
		respond_to do |format|
			format.html { render action: 'index', notice: 'Expense submitted successfully.' }
    		format.json { render json: @expense, status: :created, location: "index" }
		end
	end
  end
  
  def list_all
    @per_day_expenses_grouped_by_month = Expense.list_all
  end

  private
  def expense_params
  	params.require(:expense).permit(:expense,:date,:sub_cat_id,:user_id)
  end
end
