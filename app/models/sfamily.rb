class Sfamily < ActiveRecord::Base
	belongs_to :family
	has_many :ssfamilies
	has_many :articles, through: :ssfamilies
end
