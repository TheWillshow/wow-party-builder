class Guildmember < ActiveRecord::Base
  belongs_to :guild
  has_many :partymembers 
  has_many :parties, through: :partymembers

  validates :member_name, uniqueness:{ scope: :guild_id }, null: false
  validates :guild_id, null: false
  validates :class, null: false
end
