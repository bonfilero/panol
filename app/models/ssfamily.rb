class Ssfamily < ActiveRecord::Base
  belongs_to :sfamily
  has_many :articles
end
