class Expense < ActiveRecord::Base

  def self.list_all
    per_day_expense = select('date(date) as expense_date, sum(expense) as expense_for_the_day')
                          .group('date(date)').order(date: :desc)
    per_day_expense
  end
end
