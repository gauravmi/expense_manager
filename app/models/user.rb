class User < ActiveRecord::Base
	has_many :expenses
	has_one :amount
	has_one :budget
end