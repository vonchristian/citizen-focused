class CreateBusinessOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :business_owners do |t|
      t.references :owner, polymorphic: true
      t.belongs_to :business, foreign_key: true

      t.timestamps
    end
  end
end
