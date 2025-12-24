class Penyewa < ApplicationRecord
  has_many :sewas, dependent: :destroy
  
  validates :nama, :nomor_telepon, presence: true
end
