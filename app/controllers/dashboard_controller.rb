class DashboardController < ApplicationController
  before_filter :authenticate_user

  def index
    @organization_groups = UserOrganizationsService.process(current_user).in_groups_of 3, false
  end
end
