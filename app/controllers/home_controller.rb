class HomeController < ApplicationController
  def index; end

  def activity
    @activities = PublicActivity::Activity.all
  end

  def charts
  end
end
