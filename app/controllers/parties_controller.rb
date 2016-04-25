class Parties_Controller < ApplicationController
  def create
    @data = params[:data]
    binding.pry
  end

  def new
    @party = Party.new
    @partymember = Partymember.new
  end
end
