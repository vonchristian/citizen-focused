class CreateTenancies < ActiveRecord::Migration[5.2]
  def change
    create_table :tenancies do |t|
      t.references :tenant, polymorphic: true
      t.belongs_to :property, foreign_key: { to_table: :subscriber_properties }

      t.timestamps
    end
  end
end
