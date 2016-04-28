class Partymember < ActiveRecord::Base
  belongs_to :party
  belongs_to :guildmember
end
