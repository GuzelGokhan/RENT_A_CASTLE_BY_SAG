class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

  def home
    @castle = Castle.new
    @castles = Castle.all
  end
end
