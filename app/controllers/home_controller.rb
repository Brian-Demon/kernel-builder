class HomeController < ApplicationController
  def index
    if current_user
      @kernel_builds = current_user.kernel_builds.all
    end
  end
end
