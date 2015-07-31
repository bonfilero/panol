class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :nombre
      t.text :desc
      t.integer :saldo
      t.integer :stockmin
      t.integer :lotecompra
      t.string :unidad
      t.string :unidadcompra
      t.decimal :ucompraporudeuso
      t.references :family, index: true
      t.references :sfamily, index: true
      t.references :ssfamily, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :families
    add_foreign_key :articles, :sfamilies
    add_foreign_key :articles, :ssfamilies
  end
end
