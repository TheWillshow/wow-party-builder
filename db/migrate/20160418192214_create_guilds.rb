class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :guild_name, null: false
      t.string :server, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
