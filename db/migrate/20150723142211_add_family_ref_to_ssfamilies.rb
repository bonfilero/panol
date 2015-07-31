class AddFamilyRefToSsfamilies < ActiveRecord::Migration
  def change
    add_reference :ssfamilies, :family, index: true
    add_foreign_key :ssfamilies, :families
  end
end
