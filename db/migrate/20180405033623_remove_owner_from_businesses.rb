class RemoveOwnerFromBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :businesses, :owner, polymorphic: true
  end
end
