require "realm_list"

class HomepagesController < ApplicationController
  include Realms

  def index
    @party = Party.new
    @guild = Guild.new
    uid = session[:user_id]
    @user = User.find_by_uid(uid)
    @pg_search_models = PgSearch.multisearch(params[:query])
    @realm_list = Realms::US_REALM_LIST
    if !params[:guild_id].nil?
      @selected_guild = Guild.find(params[:guild_id])
      @guildmembers = @selected_guild.guildmembers
    end
    if !params[:party_id].nil?
      @partymembers = []
      @selected_party = Party.find(params[:party_id])
      @selected_partymembers = @selected_party.partymembers
      @partymembers = []
      i = 0
      @selected_partymembers.each do |partymember|
        @partymembers << @selected_partymembers[i].guildmember.member_name
        i+=1
      end
    end
  end
end
