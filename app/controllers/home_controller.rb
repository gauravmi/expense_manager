class HomeController < ApplicationController

  def index
		@amount = Amount.new
    @budget = Budget.new
		@sub_category = SubCategory.new    
    
		@amount_list = (Amount.order('amount ASC').all || [])
		@category_list = (SubCategory.order('count DESC').all || [])
		@expense = Expense.new
    @sub_cat = (SubCategory.fetch_all || [])
	end

	def create_sub_category
		@sub_category = SubCategory.new(subcategory_params)
		if @sub_category.save
			respond_to do |format|
				format.html { redirect_to action: :index }
	    		format.json { render json: @sub_category, status: :created, location: "index" }
    		end
  		end
	end
  
  def create_budget
    @budget = Budget.new(budget_params)
    if @budget.save
      respond_to do |format|        
        format.json { render json: @budget, status: :created, location: "index" }
      end
    end
  end
  
  def create_amount
    @amount = Amount.new(amount_params)
    if @amount.save
      respond_to do |format|
        format.html { redirect_to action: :index }
        format.json { render json: @amount, status: :created, location: "index" }
      end
    end
  end

  private
  def budget_params
    params.require(:budget).merge({:user_id=>current_user, :date=>DateTime.now.to_date.to_s}).permit(:amount,:date, :user_id)
  end
  def subcategory_params
    params.require(:sub_category).permit(:name, :icon, :main_cat_id, :user_id)
  end

  def amount_params
    params.require(:amount).permit(:amount)
  end

end