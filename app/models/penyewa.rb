# frozen_string_literal: true

class Penyewa < ApplicationRecord
  has_many :sewas, dependent: :destroy
  
  validates :nama, :nomor_telepon, presence: true
end
