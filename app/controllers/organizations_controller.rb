class OrganizationsController < ApplicationController
  def index
  end

  def show
    @projects = Repositories::ByOrganizationService.process(current_user, params[:id]).repos
  end
end
