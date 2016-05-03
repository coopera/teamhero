class DashboardController < ApplicationController
  before_filter :authenticate_user

  def index
    @organization_groups = UserOrganizationsService.process(current_user).in_groups_of 3, false
    @badges = BadgesQuery.for_user(current_user)

    @pr_points = Score.find_by(user_id: current_user.id, badge_type: Score.badge_types[:pull_request]).points
    @issue_points = Score.find_by(user_id: current_user.id, badge_type: Score.badge_types[:issue]).points
    @teamhero_points = Score.find_by(user_id: current_user.id, badge_type: Score.badge_types[:teamhero]).points
  end
end
