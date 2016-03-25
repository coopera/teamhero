class ProjectsController < ApplicationController
  def show
    @project = Repositories::ByIDService.process(current_user, *params.values_at(:organization_id, :id))
  end
end
