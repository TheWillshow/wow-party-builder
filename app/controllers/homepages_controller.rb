require "realm_list"

class HomepagesController < ApplicationController
  include Realms

  def index
    @party = Party.new
    @guild = Guild.new
    @pg_search_models = PgSearch.multisearch(params[:query])
    @realm_list = Realms::US_REALM_LIST
    if !params[:guild_id].nil?
      @selected_guild = Guild.find(params[:guild_id])
      @guildmembers = @selected_guild.guildmembers
    end
  end
end
