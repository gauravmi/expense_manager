module ApplicationHelper
	def total_income
		Budget.where('extract(month from date) = ?', Date.today.month).map(&:amount).reduce(:+)
	end
	def total_expense
		Expense.all.map(&:expense).compact.reduce(:+)
	end
end