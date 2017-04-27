class HomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def index
  end

  def home
    render layout: 'empty'
  end
end
