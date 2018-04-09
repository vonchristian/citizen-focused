class CreateDocumentaryRequirementCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :documentary_requirement_charges do |t|
      t.belongs_to :charge, foreign_key: true
      t.belongs_to :documentary_requirement, foreign_key: true, index: { name: "index_doc_requirement_on_doc_requirement_charges"}

      t.timestamps
    end
  end
end
