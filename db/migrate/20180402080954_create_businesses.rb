class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end
