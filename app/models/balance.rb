class Balance < ActiveRecord::Base
  belongs_to :article
  belongs_to :input
  belongs_to :output
end
