class Family < ActiveRecord::Base
	has_many :sfamilies
	has_many :ssfamilies, through: :sfamilies
	has_many :articles, through: :ssfamilies
end
