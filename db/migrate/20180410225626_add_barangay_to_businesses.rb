class AddBarangayToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :barangay, foreign_key: true
  end
end
