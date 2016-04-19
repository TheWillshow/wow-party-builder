class AddGuildKey < ActiveRecord::Migration
  def change
    add_reference :guildmembers, :guild,foreign_key: true
  end
end
