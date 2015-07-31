class Input < ActiveRecord::Base
  belongs_to :article
  has_one :balance
  
  validates :cantidad,  presence: true #, numericality: { greater_than: 0 }
end
