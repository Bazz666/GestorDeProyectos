class ProjectsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard

  def index
  end

  def dashboard #aplicando el filtro por estado
    if params[:state].present?
      @projects = Project.where("state = ?", params[:state])
    else
      @projects = Project.all
    end
  end

  def created
    @project = Project.create(name: params[:name], description: params[:description], start: params[:start], end: params[:end], state: params[:state])
  end
end
