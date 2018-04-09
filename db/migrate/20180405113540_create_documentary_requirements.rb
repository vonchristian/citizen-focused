class CreateDocumentaryRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :documentary_requirements do |t|
      t.belongs_to :office, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
