class PagesController < ApplicationController
    def home
      redirect_to user_path(current_user.id)
    end
  end