class CreateKasurs < ActiveRecord::Migration[8.1]
  def change
    create_table :kasurs do |t|
      t.string :nama
      t.text :deskripsi
      t.decimal :harga_per_hari
      t.string :status

      t.timestamps
    end
  end
end
