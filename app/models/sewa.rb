# frozen_string_literal: true

class Sewa < ApplicationRecord
  belongs_to :kasur
  belongs_to :penyewa

  validates :tanggal_mulai, :tanggal_selesai, :status, presence: true
  
  before_save :calculate_total_harga

  private

  def calculate_total_harga
    return if tanggal_mulai.blank? || tanggal_selesai.blank? || kasur.blank?
    
    days = (tanggal_selesai - tanggal_mulai).to_i
    days = 1 if days <= 0
    self.total_harga = days * kasur.harga_per_hari
  end
end
