class ArticleHasBuyorder < ActiveRecord::Base
  belongs_to :article
  belongs_to :buyorder
end
