class Report < ActiveRecord::Base
  conn = PGconn.open(:dbname => 'expense_development')
  res  = conn.exec('')
end