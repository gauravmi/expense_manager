class Expense < ActiveRecord::Base  
  has_one :main_category

  def self.list
    per_day_expense = select('date(date) as expense_date, sum(expense) as expense_for_the_day')
                          .group('date(date)').order(date: :desc)
    per_day_expense.group_by { |expense|
      expense[:expense_date].strftime('%B') + '    ' + expense[:expense_date].strftime('%Y')
    }
  end
end
