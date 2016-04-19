class Guild < ActiveRecord::Base
  has_many :guildmembers

  validates :guild_name, uniqueness:{ scope: :realm }, null: false
  validates :realm, null: false
end
