class ReportController < ApplicationController
  def new
  end

  def view

  end

  def apply
    in_clause_for_sql = ''
    in_clause_for_sql += '\'Food\',' if !params["food_check"].nil?
    in_clause_for_sql += '\'Shelter\',' if !params["shelter_check"].nil?
    in_clause_for_sql += '\'Utilities\',' if !params["utilities_check"].nil?
    in_clause_for_sql += '\'Transportation\',' if !params["transportation_check"].nil?
    in_clause_for_sql += '\'Giving\',' if !params["giving_check"].nil?
    month = params['report']['date(2i)'].to_i
    year = params['report']['date(1i)'].to_i

    if in_clause_for_sql.end_with?(',')
      in_clause_for_sql = in_clause_for_sql[0..-2]
    end
    to_be_put_in_sql = ""
    if in_clause_for_sql!=''
      to_be_put_in_sql = "and mc.category_name in (#{in_clause_for_sql})"
    end

    @resultant = []
    give_sql_result(to_be_put_in_sql, year, month).each do |row|
      @resultant << [row['cat_name'].to_s, row['expense_sum'].to_i]
    end

    p @resultant
    respond_to do |format|
      # redirect_to report_view_path
      format.html { render 'graph' }
    end
  end

  def give_sql_result(to_be_put_in_sql, year, month)
    conn = PGconn.open(:dbname => 'expense_development')
    res = conn.exec("select mc.category_name as cat_name,sum(expense) as expense_sum from expenses e join sub_categories sc on(e.sub_cat_id = sc.id)
  join main_categories mc on (sc.main_cat_id = mc.id) where date_part('month',e.date) = #{month}
  and date_part('year',e.date) = #{year} #{to_be_put_in_sql} group by mc.category_name")
    res
  end


end
