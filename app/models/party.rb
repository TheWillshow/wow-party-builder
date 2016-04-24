class Party < ActiveRecord::Base
  has_many :partymembers
  include PgSearch

  multisearchable :against => [:name]
end
