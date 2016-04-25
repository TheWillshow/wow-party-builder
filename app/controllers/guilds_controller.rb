class GuildsController < ApplicationController
  def create
    @guild = Guild.new(guild_params)
    if @guild_name.nil?
      flash[:alert] = "Guild not found"
    else
      @guild_name = @guild.guild_name
      @realm = @guild.realm
    end
    retrieve_guild_info
    if @guild_name == nil
      root_path
    else
      parse_guild
    end
    redirect_to root_path
  end

  def new
    @guild = Guild.new
  end

  def show
    @guild = Guild.find(params[:id])
    @guildmembers = @guild.guildmembers
    @realm_list = Realms::US_REALM_LIST
  end

  private

  def retrieve_guild_info
    RBattlenet.authenticate(api_key: ENV['BNET_KEY'])
    RBattlenet.set_region(region: "us", locale: "en_US")

    @guild_info = RBattlenet::Wow::Guild.find(name: "#{@guild_name}",
                                realm: "#{@realm}",
                                fields: ["members"])

    @guild.guild_name = @guild_info['name']
    @guild_name = @guild_info['name']

    if @guild_info['reason'] == "Guild not found."
      @guild_name = nil
      flash[:alert] = "Guild not found"
    elsif Guild.exists?(guild_name:'@guild_name')
      flash[:alert] = "Guild already in Database"
      @guild = Guild.find_by guild_name: "#{@guild_name}"
    elsif @guild.id.nil?
      binding.pry
      flash[:alert] = "Guild not found"
    else
      @guild = Guild.new(guild_name:"#{@guild_name}", realm:"#{@realm}")
      @guild.save
      flash[:notice] = "Guild has been imported"
    end
  end

  def parse_guild
    @guild = Guild.find_by guild_name: "#{@guild_name}"
    i = 0
    if @guild_info['reason'] == "Guild not found."
      @guild_name = nil
      flash[:alert] = "Guild not found"
      root_path
    else
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
  end

  def guild_params
    params.require(:guild).permit(:guild_name.downcase, :realm.downcase)
  end
end
