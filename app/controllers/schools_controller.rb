class SchoolsController < ApplicationController
  def index
    @schools = School.all
    render :index
  end
end
