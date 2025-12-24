class CreatePenyewas < ActiveRecord::Migration[8.1]
  def change
    create_table :penyewas do |t|
      t.string :nama
      t.text :alamat
      t.string :nomor_telepon
      t.string :identitas

      t.timestamps
    end
  end
end
