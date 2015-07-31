class Buyorder < ActiveRecord::Base
	has_many :articles, through :article_has_buyorder
end