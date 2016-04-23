class GuildsController < ApplicationController
  def create
    @guild = Guild.new(guild_params)
    if @guild.save
      flash[:notice] = "Guild has been imported"
      root_path
    elsif Guild.exists?
      flash[:alert] = "Guild already in Database"
    else
      @guild = Guild.find_by guild_name: "#{@guild_name}"
    end

    @guild_name = @guild.guild_name
    @realm = @guild.realm

    retrieve_guild_info
    parse_guild
    redirect_to root_path
  end

  def new
    @guild = Guild.new
  end

  private

  def retrieve_guild_info
    RBattlenet.authenticate(api_key: ENV['BNET_KEY'])
    RBattlenet.set_region(region: "us", locale: "en_US")

    @guild_info = RBattlenet::Wow::Guild.find(name: "#{@guild_name}",
                                realm: "#{@realm}",
                                fields: ["members"])
  end

  def create_guild
    @guild_name = @guild_info['name']
    @realm = @guild_info['realm']
    @guild = Guild.new(guild_name:"#{@guild_name}", realm:"#{@realm}")
    if @guild.save
      root_path
    else
      @guild = Guild.find_by guild_name: "#{@guild_name}"
    end

  end

  def parse_guild
    create_guild
    i = 0
    @guild_info["members"].each do |member|
      @member_name = @guild_info['members'][i]['character']['name']
      @level = @guild_info['members'][i]['character']['level']
      @class = @guild_info['members'][i]['character']['class']
      @spec = @guild_info['members'][i]['character']['spec']
      if @spec == nil
        @spec = ""
      else
        @spec = @guild_info['members'][i]['character']['spec']['name']
      end


      @guildmember = Guildmember.new(member_name:"#{@member_name}", guild_id:"#{@guild.id}",
      level:"#{@level}", character_class:"#{@class}", spec:"#{@spec}")
      @guildmember.save
      i += 1
    end
  end
  def guild_params
    params.require(:guild).permit(:guild_name.downcase, :realm.downcase)
  end
end
