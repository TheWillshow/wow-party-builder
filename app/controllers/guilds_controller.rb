class GuildsController < ApplicationController
  def index

  end

  def create
    @guild = User.new(guild_params)

    if @guild.save
      flash[:notice] = "#{@guild.name} is saved to your profile"
    else
      flash[:alert] = "Guild not saved"
    end
    redirect_to root_path
  end

  def new
    @guild = Guild.new
  end

  def show

  end
  private

  def retrieve_guild_info

    RBattlenet.authenticate(api_key: ENV['BNET_API'])
    RBattlenet.set_region(region: "us", locale: "en_US")

    @guild_info = RBattlenet::Wow::Guild.find(name: params['name'],
                                realm: "illidan",
                                fields: ["members", "name", "class", "level", "spec"])
  end

  def guild_params
    params.require(:guild).permit(:guild_name, :realm)
  end
end
