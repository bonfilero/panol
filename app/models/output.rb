class Output < ActiveRecord::Base
  belongs_to :article
  has_one :balance
  belongs_to :worker
  belongs_to :equipment

  validates :cantidad,  presence: true #, numericality: { greater_than: 0 }
end
