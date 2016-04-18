class CreateGuildmembers < ActiveRecord::Migration
  def change
    create_table :guildmembers do |t|
      t.string :membername, null: false
      t.string :class, null: false
      t.integer :level, null: false
      t.string :spec
      t.string :secondary_spec
      t.belongs_to :guild
      t.belongs_to :users

      t.timestamps
    end
  end
end
