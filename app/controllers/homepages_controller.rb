class HomepagesController < ApplicationController
  def index
    binding.pry
  end

  private

  def retrieve_guild_info
    RBattlenet.authenticate(api_key: ENV['BNET_API'])
    RBattlenet.set_region(region: "us", locale: "en_US")

    @guild_info = RBattlenet::Wow::Guild.find(name: "Last Pull",
                                realm: "illidan",
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
    @guild_info.each_with_index do |member, index|
      create_guild
      @member_name = @guild_info['members'][index]['character']['name']
      @level = @guild_info['members'][index]['character']['level']
      @class = @guild_info['members'][index]['character']['class']
      @spec = @guild_info['members'][index]['character']['spec']['name']

      @guild_id = @guild.id
      @guildmember = Guildmember.new(member_name:"#{@member_name}", guild_id:"#{@guild.id}",
      level:"#{@level}", character_class:"#{@class}", spec:"#{@spec}")
      @guildmember.save
    end
  end
end
