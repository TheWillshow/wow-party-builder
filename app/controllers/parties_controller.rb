class PartiesController < ApplicationController
  def create
    @party_members = []
    uid = session[:user_id]
    @user = User.find_by_uid(uid)
    @user_id = @user.id
    unless params['member1'].nil?
      @party_members << params['member1']
    end
    unless params['member2'].nil?
      @party_members << params['member2']
    end
    unless params['member3'].nil?
      @party_members << params['member3']
    end
    unless params['member4'].nil?
      @party_members << params['member4']
    end
    unless params['member5'].nil?
      @party_members << params['member5']
    end
    @party = Party.new(name: params['party']['name'], user: @user)
    binding.pry
    if !@party.save
      flash[:alert] = "Party not saved."
      redirect_to root_path
    else
      @party.save
      flash[:success] = "Party saved."
      redirect_to root_path
    end

    @party_members.each_with_index do |name|
      @guildmember = Guildmember.find_by member_name: "#{name}"
      @partymember = Partymember.new(party_id: @party.id, guildmember_id: @guildmember.id)
      @partymember.save
    end
  end

  def new
    @party = Party.new
  end

  def show
    @party = Party.find(params[:searchable_id])
    @partymembers = @party.partymembers
    @realm_list = Realms::US_REALM_LIST

  end
end
