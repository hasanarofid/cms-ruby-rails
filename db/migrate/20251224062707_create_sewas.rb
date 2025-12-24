class CreateSewas < ActiveRecord::Migration[8.1]
  def change
    create_table :sewas do |t|
      t.references :kasur, null: false, foreign_key: true
      t.references :penyewa, null: false, foreign_key: true
      t.date :tanggal_mulai
      t.date :tanggal_selesai
      t.decimal :total_harga
      t.string :status

      t.timestamps
    end
  end
end
