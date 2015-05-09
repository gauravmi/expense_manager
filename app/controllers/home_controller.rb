class HomeController < ApplicationController
	def index
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

	private
  	def amount_params
    	params.require(:amount).permit(:amount)
  	end
end