class PagesController < ApplicationController
  def home
    redirect_to tasks_url if current_user
  end

  def about
  end
end
