class Equipment < ActiveRecord::Base
  belongs_to :ssystem
  has_many :outputs
end
