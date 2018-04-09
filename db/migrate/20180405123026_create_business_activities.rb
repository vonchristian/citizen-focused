class CreateBusinessActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :business_activities do |t|
      t.belongs_to :activity, foreign_key: true
      t.belongs_to :business, foreign_key: true

      t.timestamps
    end
  end
end
