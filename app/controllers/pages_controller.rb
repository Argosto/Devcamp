class PagesController < ApplicationController
  def home
    @magics = Magic.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
