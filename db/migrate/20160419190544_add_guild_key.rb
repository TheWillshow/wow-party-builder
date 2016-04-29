class AddGuildKey < ActiveRecord::Migration
  def change
    add_reference :guildmembers, :guild, null: false, foreign_key: true
  end
end
