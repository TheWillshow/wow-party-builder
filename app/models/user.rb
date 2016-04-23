class User < ActiveRecord::Base
  validates :uid, uniqueness: true, presence: true
  validates :battletag, uniqueness: true, presence: true
end
