class Guild < ActiveRecord::Base
  include PgSearch
  has_many :guildmembers

  validates :guild_name, uniqueness:{ scope: :realm }, null: false
  validates :realm, null: false

  multisearchable :against => [:guild_name, :realm]
end
