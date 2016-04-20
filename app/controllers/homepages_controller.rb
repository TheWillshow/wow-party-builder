require "realm_list"

class HomepagesController < ApplicationController
  include Realms
  def index
    @realm_list = Realms::US_REALM_LIST
    @guild = Guild.new
  end
end
