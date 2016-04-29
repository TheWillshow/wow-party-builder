class Party < ActiveRecord::Base
  has_many :partymembers
  has_many :guildmembers, through: :partymembers
  belongs_to :user

  validates :name, uniqueness: true, null: false
  validates :user_id, presence: true, null: false
  include PgSearch

  multisearchable :against => [:name]
end
