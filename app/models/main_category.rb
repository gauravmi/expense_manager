class MainCategory < ActiveRecord::Base
	has_many :sub_categories
end