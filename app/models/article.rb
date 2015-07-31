class Article < ActiveRecord::Base
  belongs_to :sfamily
  belongs_to :family
  belongs_to :ssfamily
  has_many :balances
  has_many :inputs
  has_many :outputs
  has_many :buyorders, through :article_has_buyorder
end
