class CreateGuildmembers < ActiveRecord::Migration
  def change
    create_table :guildmembers do |t|
      t.string :member_name, null: false
      t.integer :class, null: false
      t.integer :level, null: false
      t.string :spec

      t.timestamps
    end
  end
end
