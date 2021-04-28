class HomeController < ApplicationController
  def index; end

  def activity
    @activities = PublicActivity::Activity.all
  end

  def reports
  end

end
