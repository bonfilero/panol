class Buyorder < ActiveRecord::Base
	has_many :articles, through: :article_has_buyorder
	has_many :article_has_buyorder
end