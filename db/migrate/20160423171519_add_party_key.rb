class AddPartyKey < ActiveRecord::Migration
  def change
    add_reference :partymembers, :party, foreign_key: true
    add_reference :partymembers, :guildmember, foreign_key: true
  end
end
