class AddUserToParty < ActiveRecord::Migration
  def change
    add_reference :parties, :user, foreign_key: true
  end
end
