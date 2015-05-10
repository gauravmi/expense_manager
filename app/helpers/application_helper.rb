module ApplicationHelper
	def total_income
		Budget.select(:amount).order('amount desc').all.first.amount
	end
	def total_expense
		Expense.all.map(&:expense).compact.reduce(:+)
	end
end