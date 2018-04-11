class RemoveSupporterFromBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :businesses, :supporter, foreign_key: { to_table: :subscribers }
  end
end
