class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :guild_name, null: false
      t.string :realm, null: false

      t.timestamps
    end
  end
end
