class HomeController < ApplicationController
	def index
		@amount = Amount.new
		@sub_category = SubCategory.new
		@amount_list = Amount.all
		@category_list = SubCategory.all
		@expense = Expense.new
	end
	
	def create_amount
		@amount = Amount.new(amount_params)
		if @amount.save
			respond_to do |format|
				format.html { render action: 'index', notice: 'amount added successfully.' }
	    		format.json { render json: @amount, status: :created, location: "index" }
    		end
  		end
	end
	def create_sub_category
		@sub_category = SubCategory.new(subcategory_params)
		if @sub_category.save
			respond_to do |format|
				format.html { render action: 'index', notice: 'Sub category added successfully.' }
	    		format.json { render json: @sub_category, status: :created, location: "index" }
    		end
  		end
	end

	private
	def subcategory_params
		params.require(:sub_category).permit(:name,:icon,:main_cat_id,:user_id)
	end

  	def amount_params
  		params.require(:amount).permit(:amount)    	
  	end
end