require "realm_list"

class HomepagesController < ApplicationController
  include Realms
  def index
    @guild = Guild.new
    @party = Party.new
    @pg_search_models = PgSearch.multisearch(params[:query])
    @realm_list = Realms::US_REALM_LIST
    @guildmembers = Guildmember.all
  end
end
