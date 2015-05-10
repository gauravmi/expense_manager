class SubCategory < ActiveRecord::Base

  def self.fetch_all
    conn = PGconn.open(:dbname => 'expense_development')
    res  = conn.exec("select name, sum(expense) from expenses JOIN sub_categories ON sub_categories.id = expenses.sub_cat_id where date_part('month', date) = #{Date.today.month} and date_part('year', date) = #{Date.today.year} group by name")
    resultant = []
    res.each do |row|
      resultant << [row['name'].to_s,row['sum'].to_i]
    end
    resultant
  end

end
