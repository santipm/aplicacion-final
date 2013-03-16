class HomeController < ApplicationController
  def index
    @users = User.paginate(:page=>params[:page],:per_page=>6)
 
  end
end
