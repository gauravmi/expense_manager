module ApplicationHelper
	def total_income
		Budget.where('extract(month from date) = ?', Date.today.month).map(&:amount).reduce(:+)
	end
	def total_expense
		Expense.all.map(&:expense).map(&:to_i).compact.reduce(:+)
	end
	
	def status
		total_expense < total_income ? "good" : "danger"
	end
end