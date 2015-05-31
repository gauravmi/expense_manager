class ReportController < ApplicationController
  def new
  end

  def view
    display_date = params[:date] || "12/12/12"
    current_month = Date.strptime(display_date, '%m/%d/%Y')
    category_names = params[:report] && params[:report]["category"].collect{|k,v| p k if v=="1"}.compact || [:food]
    dates_for_a_month = (current_month.beginning_of_month..current_month.end_of_month).to_a
    @month_expenses = current_user.expenses.where(:date=>dates_for_a_month).select("sum(expense) as category_sum, sub_category_id").group(:sub_category_id)
  end

  def apply
  end
end