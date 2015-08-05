class Work < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :worker
end
