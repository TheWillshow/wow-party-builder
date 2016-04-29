class User < ActiveRecord::Base
  has_many :parties, foreign_key: 'user_id'
  validates :uid, uniqueness: true, presence: true
  validates :battletag, uniqueness: true, presence: true
end
