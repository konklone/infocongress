class ElectedsController < ApplicationController
  def index
    unless logged_in?
      redirect_to root_path
    end
    @electeds = Elected.all.sort_by {|a| [a.house, a.last_name]}
    @elected = Elected.new
  end
  def show
    @elected = Elected.find_by_id(params[:id].to_i)
  end

  def filter
    @electeds = Elected.where(state: params[:state])
    @elected = Elected.new
    render(:index)
  end
end
