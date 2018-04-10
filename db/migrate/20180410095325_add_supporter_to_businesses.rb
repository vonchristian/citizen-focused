class AddSupporterToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :supporter, foreign_key: { to_table: :subscribers }
  end
end
