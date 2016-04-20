class Guildmember < ActiveRecord::Base
  belongs_to :guild

  validates :member_name, uniqueness:{ scope: :guild_id }, null: false
  validates :guild_id, null: false
  validates :class, null: false
end
