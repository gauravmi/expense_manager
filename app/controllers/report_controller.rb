class ReportController < ApplicationController
  def new
  end

  def view
    display_date = params[:date] || "12/12/12"
    current_month = Date.strptime(display_date, '%m/%d/%Y')
    category_names = params[:report] && params[:report]["category"].collect{|k,v| k if v=="1"}.compact || [:food]
    dates_for_a_month = (current_month.beginning_of_month..current_month.end_of_month).to_a
    
    @month_expenses = current_user.expenses.select("sum(expense) as category_sum, sub_category_id").group(:sub_category_id)
    @graph_data = []
    @month_expenses.each do |e| 
      category_name = SubCategory.find_by_id(e.sub_category_id).name
      display_name = category_name if category_names.map(&:upcase).include?(category_name.upcase)
      @graph_data << [display_name , e.category_sum] if display_name
    end

  end

  def apply
  end
end

