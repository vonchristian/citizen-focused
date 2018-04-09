class CreateActivityCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_charges do |t|
      t.belongs_to :activity, foreign_key: true
      t.belongs_to :charge, foreign_key: true

      t.timestamps
    end
  end
end
