class ExpenseController < ApplicationController
  def new
  end
  
  def create
  	@expense = Expense.new(expense_params)
    frequently_accessed_numbers = params[:expense][:count]
  	if @expense.save
      frequently_accessed_numbers.keys.each{|k| Amount.find_by_amount(k).update_attributes({count: frequently_accessed_numbers[k]})}
  		respond_to do |format|
      		format.json { render json: @expense, status: :created}
  		end
  	end
  end
  
  def list_all
    @per_day_expenses_grouped_by_month = Expense.list_all
  end

  private
  def expense_params
  	params.require(:expense).merge({:user_id=>current_user}).permit(:expense,:date,:sub_cat_id,:user_id)
  end
end