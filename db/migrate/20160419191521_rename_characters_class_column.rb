class RenameCharactersClassColumn < ActiveRecord::Migration
  def change
    rename_column :guildmembers, :class, :character_class
  end
end
