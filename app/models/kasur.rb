class Kasur < ApplicationRecord
  has_many :sewas, dependent: :destroy
  
  validates :nama, :harga_per_hari, :status, presence: true
end
